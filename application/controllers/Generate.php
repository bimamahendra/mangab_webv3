<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Generate extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('Mgenerate');
		$this->load->library('ciqrcode');
		$this->load->helper('string');
	}

	//get list matkul yang diampu
	public function absenlist(){
		$nip = $this->session->userdata('nip');
		$param['main_content'] = 'generate/moveqr';
		$param['cekkelas'] = $this->Mgenerate;
		$param['matkul_list'] = $this->Mgenerate->getAllMatkulByNIP($nip);
		$this->load->view('dashboard', $param);
	}

	//generate QR Code kelas
	public function generate(){
		$nip = $this->session->userdata('nip');
		$sixdigit 	= $this->sixdigit();
		$id 		= $this->input->post('id');
		$topik 		= $this->input->post('topik');
		$jenis 		= $this->input->post('radioJenis');
		$lat		= $this->input->post('getLat');
		$long		= $this->input->post('getLong');

		date_default_timezone_set('Asia/Jakarta'); # add your city to set local time zone
		$now = date('Y-m-d H:i:s');
		
		$config['cacheable']    	= true; //boolean, the default is true
	    $config['cachedir']     = './assets/'; //string, the default is application/cache/
	    $config['errorlog']     = './assets/'; //string, the default is application/logs/
	    $config['imagedir']     = './assets/images/qr/'; //direktori penyimpanan qr code
	    $config['quality']      = true; //boolean, the default is true
	    $config['size']         = '1024'; //interger, the default is 1024
	    $config['black']        = array(224,255,255); // array, default is array(255,255,255)
	    $config['white']        = array(70,130,180); // array, default is array(0,0,0)
	    $this->ciqrcode->initialize($config);
	 
	    $image_name=$sixdigit.'.png';
	 
	    $params['data'] 		= $sixdigit; //data yang akan di jadikan QR CODE
	    $params['level'] 		= 'H'; //H=High
	    $params['size'] 		= 10;
	    $params['savename'] = FCPATH.$config['imagedir'].$image_name;
	    $this->ciqrcode->generate($params); // fungsi untuk generate QR CODE

	    $datakelas = array(
	    	"ID_ABSEN" 		=> $sixdigit,
	    	"ID_JADWAL" 	=> $id,
			"NIP_DOSEN"		=> $nip,
	    	"TOPIK_ABSEN"	=> $topik,
			"METODE_ABSEN"	=> $topik,
			"TS_ABSEN" 		=> $now,
			"JENIS_ABSEN" 	=> $jenis,
			"LONG_ABSEN" 	=> $long,
			"LAT_ABSEN" 	=> $lat,
	    	"STATUS_ABSEN" 	=> 0
	    );
	 		$getmhs = $this->Mgenerate->getmhs($id);

		$inputkelas = $this->Mgenerate->saveqr($datakelas);

	 		$detailAbsenMhs = array();

	 		foreach($getmhs as $mhs){
				$dataDetailAbsen["ID_DETABSEN"] = $this->serial_meeting();
	 			$dataDetailAbsen["ID_ABSEN"] = $sixdigit;
				$dataDetailAbsen["GET_NRP"] = $mhs["NRP_MHS"];
				$dataDetailAbsen["STATUS_DETABSEN"] = 0;
				$dataDetailAbsen["TS_DETABSEN"] = null;

	      		$detailAbsenMhs[] = $dataDetailAbsen;
	 		}

	 		$inputMhs = $this->Mgenerate->savedet($detailAbsenMhs);

	    if($inputkelas && ($inputMhs > 0 ) ){
	    	redirect('Generate/showqr/'.$sixdigit); 
	    }else{
	    	$this->session->set_flashdata('error_message', 'QR generate failed!');
				redirect('Generate/absenlist');
	    }
	}

	//generate random digit
	public function sixdigit(){
		$randomdigit = random_string('alnum',6);

		$cek = $this->Mgenerate->cekrand($randomdigit);
		if( $cek > 0){
			$this->sixdigit();
		}else{
			return $randomdigit;
		}
	}

	public function serial_meeting(){
		$randomdigit = random_string('alnum',16);

		$cek = $this->Mgenerate->cekserial($randomdigit);
		if( $cek > 0){
			$this->serial_meeting();
		}else{
			return $randomdigit;
		}
	}

	public function showqr($qr){
		$param['main_content'] = 'generate/showqr';
		$param['uniqcode'] = $qr;
		$param['datakelas'] = $this->Mgenerate->getkelas($qr);
		$this->load->view('dashboard', $param);
	}

	public function recap($qr){
		$param['main_content'] = 'generate/recap';
		$param['uniqcode'] = $qr;
		$param['datamhs'] = $this->Mgenerate->getrecap($qr);
		$this->load->view('dashboard', $param);
	}

	public function confirm($qr){
		$jml = $this->Mgenerate->getjmlmhs($qr);
		for($i = 1; $i <= $jml; $i++){
				$nrp = $this->input->post('nrp'.$i);
				$stat = $this->input->post('radion'.$i);

			$this->Mgenerate->updaterekap($qr, $nrp, $stat);
		}

		$note = $this->input->post('catatan');
		$updatenote = $this->Mgenerate->updatenote($note, $qr);

		redirect('Generate/absenlist');
	}

	public function detail($id){
		$param['main_content'] = 'generate/detaillist';
		$param['datadet'] = $this->Mgenerate->getdetail($id);
		$param['matkuldet'] = $this->Mgenerate->getnamamatkul($id);
		$this->load->view('dashboard', $param);
	}

	public function history(){
		$nip = $this->session->userdata('nip');
		$param['main_content'] = 'generate/history';
		$param['listhistory'] = $this->Mgenerate->gethistory($nip);
		$this->load->view('dashboard',$param);
	}

	public function changepw(){
		$param['main_content'] = 'generate/changepw';
		$this->load->view('dashboard', $param);
	}

	public function changepass(){
		$old = $this->input->post('old');
		$new = $this->input->post('new');
		$confirm = $this->input->post('confirm');

		$oldPass = hash('sha256', md5($old));
		$newPass = hash('sha256', md5($confirm));

		if($new != $confirm){
			$this->session->set_flashdata('error_change', 'Password baru & Password konfirmasi tidak sama, silahkan ulangi');
			redirect('Generate/changepw');
		}else if($this->Mgenerate->cekpass($oldPass)->num_rows()<= 0){
			$this->session->set_flashdata('error_change', 'Password lama yang anda masukan salah, silahkan ulangi');
			redirect('Generate/changepw');
		}else{
			$change = $this->Mgenerate->changepass($newPass);
			if($change){
				$this->session->set_flashdata('success_change', 'Password berhasil diubah');
				redirect('Generate/changepw');
			}else{
				$this->session->set_flashdata('error_change', 'Gagal merubah password, silahkan ulangi');
			redirect('Generate/changepw');
			}
		}
	}

	public function pertemuanke($id){
		$cekrow = $this->Mgenerate->sumJadwal($id);

		return $cekrow + 1;
	}
}