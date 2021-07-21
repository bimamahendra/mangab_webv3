<?php
defined('BASEPATH') OR exit('No direct script access allowed');

date_default_timezone_set("Asia/Jakarta");

class Absen extends CI_Controller {

    function __construct()
    {
        parent::__construct();
        $this->load->library("encryption");
        $this->load->database();
        $this->load->model('Mgenerate');
        $this->load->library('ciqrcode');
        $this->load->helper('string');
    }

    public function absenMhs(){
        $response = [];

        $qrCode = $this->input->post("qr_code");
        $nrp = $this->input->post("nrp");
        $statusAbsen = $this->input->post("status_absen");
        $latitudeMhs = $this->input->post("latitude_mhs");
        $longitudeMhs = $this->input->post("longitude_mhs");

        $data = $this->db
        ->where("NRP_MHS", $nrp)
        ->where("ID_ABSEN", $qrCode)
        ->get("detail_absen")
        ->row();

        if($data == null){
            $response["error"] = false;
            $response["message"] = "Student is not recognize in subject";
            
            $this->throw(200, $response);
            return;
        }

        $data = $this->db
        ->where("ID_ABSEN", $qrCode)
        ->get("detail_absen")
        ->row();

        if($data == null){
            $response["error"] = false;
            $response["message"] = "Attendance is not found";
            
            $this->throw(200, $response);
            return;
        }
        
        $data = $this->db
        ->where("ID_ABSEN", $qrCode)
        ->get("absen")
        ->row();
        
        if($data->STATUS_ABSEN == 1){
            $response["error"] = false;
            $response["message"] = "Class is over";
            
            $this->throw(200, $response);
            return;
        }

        $data = $this->db
        ->where("ID_ABSEN", $qrCode)
        ->where("NRP_MHS", $nrp)
        ->get("detail_absen")
        ->row();

        if($data->STATUS_DETABSEN == 1){
            $response["error"] = true;
            $response["message"] = "Already Attended";
            
            $this->throw(200, $response);
            return;
        }
        
        $currentTimeStamp = date("Y-m-d H:i:s");
        $data = $this->db
        ->where("ID_ABSEN", $qrCode)
        ->get("absen")
        ->row();
        
        if($data->JENIS_ABSEN == 0){
            if($this->rangeCheck($longitudeMhs, $latitudeMhs, $data->LONG_ABSEN, $data->LAT_ABSEN) < 50){
                $this->db->query("UPDATE detail_absen 
                SET STATUS_DETABSEN =".$statusAbsen.", 
                TS_DETABSEN = '".$currentTimeStamp."' 
                WHERE ID_ABSEN = '".$qrCode."' 
                AND NRP_MHS = '".$nrp."'");
        
                if($this->db->affected_rows() > 0){
                    $response["error"] = true;
                    $response["message"] = "Attended";
                    $this->throw(200, $response);
                    return;
                }
            }
            
            $response["error"] = false;
            $response["message"] = "Out of range";
            $this->throw(200, $response);
            return;
        }
        
        $this->db->query("UPDATE detail_absen 
            SET STATUS_DETABSEN =".$statusAbsen.", 
            TS_DETABSEN = '".$currentTimeStamp."' 
            WHERE ID_ABSEN = '".$qrCode."' 
            AND NRP_MHS = '".$nrp."'");
        
            if($this->db->affected_rows() > 0){
                $response["error"] = true;
                $response["message"] = "Attended";
                $this->throw(200, $response);
                return;
            }

        $response["error"] = false;
        $response["message"] = "Error found";

        $this->throw(200, $response);
    }
    
    public function rangeCheck($longitudeMhs, $latitudeMhs, $longitudeLec, $latitudeLec){
        // $pi80 = M_PI / 180;
        // $latitudeMhs *= $pi80; 
        // $longitudeMhs *= $pi80; 
        // $latitudeLec *= $pi80; 
        // $longitudeLec *= $pi80; 
        // $r = 6372.797; // mean radius of Earth in km 
        // $dlat = $latitudeLec - $latitudeMhs; 
        // $dlon = $longitudeLec - $longitudeMhs; 
        // $a = sin($dlat / 2) * sin($dlat / 2) + cos($latitudeMhs) * cos($latitudeLec) * sin($dlon / 2) * sin($dlon / 2); 
        // $c = 2 * atan2(sqrt($a), sqrt(1 - $a)); 
        // $km = $r * $c; 
        // //echo ' '.$km; 
        // return $km; 
        
        $theta = $longitudeMhs - $longitudeLec;
        $dist = (sin(deg2rad($latitudeMhs)) * sin(deg2rad($latitudeLec))) + (cos(deg2rad($latitudeMhs)) * cos(deg2rad($latitudeLec)) * cos(deg2rad($theta)));
        $dist = acos($dist);
        $dist = rad2deg($dist);
                
        $meter = $dist * 60 * 1.1515 * 1.609344 * 1000;
                
        // if($meter <= 100)
        // {
        //     return $meter;
        // }
        
        return $meter;
    }

    public function detailAbsen(){
        $response = [];

        $id = $this->input->post("id_absen");

        $data = $this->db->query("SELECT detail_absen.NRP_MHS, mahasiswa.NAMA_MHS, mahasiswa.EMAIL_MHS, detail_absen.STATUS_DETABSEN FROM detail_absen JOIN mahasiswa ON detail_absen.NRP_MHS = mahasiswa.NRP_MHS WHERE detail_absen.ID_ABSEN = '".$id."'")->result();

        if(count($data) > 0){
            $response["error"] = false;
            $response["message"] = "Attendance detail found";
            $response["data"] = $data;
            
            $this->throw(200, $response);
            return;
        }

        $response["error"] = true;
        $response["message"] = "Attendance detail is not found";
        $this->throw(200, $response);
    }

    public function historyAbsensiDosen(){
        $response = [];

        $nip = $this->input->post("nip");

        $data = $this->db->query("SELECT pertemuan.ID_PRTMN,
pertemuan.KODE_MATKUL,
       pertemuan.KELAS_PRTMN,
            jadwal.RUANG_KELAS,
            matakuliah.NAMA_MATKUL,
            jadwal.ID_JADWAL,
            absen.ID_ABSEN,
            absen.TOPIK_ABSEN,
            absen.TS_ABSEN,
            SUM(if(detail_absen.STATUS_DETABSEN = 0, 1, 0)) AS alpha,
            SUM(if(detail_absen.STATUS_DETABSEN = 1, 1, 0)) AS hadir,
            SUM(if(detail_absen.STATUS_DETABSEN = 2, 1, 0)) AS sakit,
            SUM(if(detail_absen.STATUS_DETABSEN = 3, 1, 0)) AS izin
                FROM pengampu
                JOIN pertemuan ON pertemuan.ID_PRTMN = pengampu.ID_PRTMN
                JOIN matakuliah ON pertemuan.KODE_MATKUL = matakuliah.KODE_MATKUL
                JOIN jadwal ON pertemuan.ID_PRTMN = jadwal.ID_PRTMN
                JOIN absen ON jadwal.ID_JADWAL = absen.ID_JADWAL
                JOIN detail_absen ON absen.ID_ABSEN = detail_absen.ID_ABSEN
                WHERE pengampu.NIP_DOSEN = '".$nip."' AND absen.STATUS_ABSEN = 1
                GROUP BY absen.ID_ABSEN ORDER BY absen.TS_ABSEN DESC
            ")->result();

            if(count($data) > 0){    
                $response["error"] = false;
                $response["message"] = "History found";
                $response["data"] = $data;

                $this->throw(200, $response);
                return;
            }

            $response["error"] = true;
            $response["message"] = "History is not found";

            $this->throw(200, $response);
            return;
        
        $response["error"] = true;
        $response["message"] = "History is not found";
        $this->throw(200, $response);
    }
    
    public function summaryAbsensiDosen(){
        $response = [];

        $nip = $this->input->post("nip");

        $data = $this->db->query("SELECT pertemuan.KODE_MATKUL,
                                matakuliah.NAMA_MATKUL,
                                pertemuan.KELAS_PRTMN,
                                jadwal.RUANG_KELAS,
                                jadwal.ID_JADWAL,
                                jadwal.HARI_KELAS,
                                DATE_FORMAT(jadwal.WAKTU_AWAL,'%H:%i') as WAKTU_AWAL,
                                DATE_FORMAT(jadwal.WAKTU_AKHIR, '%H:%i') as WAKTU_AKHIR,
                                
                                COUNT(absen.ID_ABSEN) AS PERTEMUANKE
                        FROM pengampu
                JOIN pertemuan ON pengampu.ID_PRTMN = pertemuan.ID_PRTMN
                JOIN jadwal ON pertemuan.ID_PRTMN = jadwal.ID_PRTMN
                JOIN matakuliah ON pertemuan.KODE_MATKUL = matakuliah.KODE_MATKUL
                    LEFT JOIN absen ON absen.ID_JADWAL = jadwal.ID_JADWAL
                WHERE pengampu.NIP_DOSEN = '".$nip."' AND absen.STATUS_ABSEN = 1 GROUP BY jadwal.ID_JADWAL
            ")->result();

            if(count($data) > 0){    
                $response["error"] = false;
                $response["message"] = "Summary found";
                $response["data"] = $data;

                $this->throw(200, $response);
                return;
            }

            $response["error"] = true;
            $response["message"] = "Summary is not found";

            $this->throw(200, $response);
            return;
        
        $response["error"] = true;
        $response["message"] = "Summary is not found";
        $this->throw(200, $response);
    }
    
    
    public function historyAbsensiMhs(){
        $response = [];

        $nrp = $this->input->post("nrp");

            $data = $this->db->query("SELECT 
                            pertemuan.KODE_MATKUL,
            				matakuliah.NAMA_MATKUL,
            				pertemuan.KELAS_PRTMN,
            				jadwal.RUANG_KELAS,
            				jadwal.ID_JADWAL,
            				absen.TS_ABSEN,
            				absen.TOPIK_ABSEN,
            				detail_absen.STATUS_DETABSEN FROM detail_absen
                    	JOIN absen ON detail_absen.ID_ABSEN = absen.ID_ABSEN
                        JOIN jadwal ON absen.ID_JADWAL = jadwal.ID_JADWAL
                        JOIN pertemuan ON jadwal.ID_PRTMN = pertemuan.ID_PRTMN
                        JOIN matakuliah ON pertemuan.KODE_MATKUL = matakuliah.KODE_MATKUL
                    WHERE detail_absen.NRP_MHS = '".$nrp."'
                    AND absen.STATUS_ABSEN = 1
                    ORDER BY(absen.TS_ABSEN) DESC
            ")->result();

            if(count($data) > 0){    
                $response["error"] = false;
                $response["message"] = "History found";
                $response["data"] = $data;

                $this->throw(200, $response);
                return;
            }

            $response["error"] = true;
            $response["message"] = "History is not found";

            $this->throw(200, $response);
            return;

        $response["error"] = true;
        $response["message"] = "History is not found";
        $this->throw(200, $response);
    }
    
    public function summaryAbsensiMhs(){
        $response = [];

        $nrp = $this->input->post("nrp");

        $data = $this->db->query("SELECT 
                            pertemuan.KODE_MATKUL,
            				matakuliah.NAMA_MATKUL,
            				pertemuan.KELAS_PRTMN,
            				jadwal.RUANG_KELAS,
            				jadwal.ID_JADWAL,
                            SUM(if(detail_absen.STATUS_DETABSEN = 0, 1, 0)) AS alpha,
                            SUM(if(detail_absen.STATUS_DETABSEN = 1, 1, 0)) AS hadir,
                            SUM(if(detail_absen.STATUS_DETABSEN = 2, 1, 0)) AS sakit,
                            SUM(if(detail_absen.STATUS_DETABSEN = 3, 1, 0)) AS izin,
                            SUM(detail_absen.STATUS_DETABSEN) AS pertemuanke
                            FROM detail_absen
                    	JOIN absen ON detail_absen.ID_ABSEN = absen.ID_ABSEN
                        JOIN jadwal ON absen.ID_JADWAL = jadwal.ID_JADWAL
                        JOIN pertemuan ON jadwal.ID_PRTMN = pertemuan.ID_PRTMN
                        JOIN matakuliah ON pertemuan.KODE_MATKUL = matakuliah.KODE_MATKUL
                    WHERE detail_absen.NRP_MHS = '".$nrp."'
                    AND absen.STATUS_ABSEN = 1
                    GROUP BY jadwal.ID_JADWAL
                    ORDER BY(absen.TS_ABSEN) DESC
            ")->result();

            if(count($data) > 0){    
                $response["error"] = false;
                $response["message"] = "Summary found";
                $response["data"] = $data;

                $this->throw(200, $response);
                return;
            }

            $response["error"] = true;
            $response["message"] = "Summary is not found";

            $this->throw(200, $response);
            return;
        
        $response["error"] = true;
        $response["message"] = "Summary is not found";
        $this->throw(200, $response);
    }

    public function rekap(){
        $response = [];

        $idAbsen = $this->input->post("id_absen");
        $note = $this->input->post("note");

            $data = $this->db->where("ID_ABSEN", $idAbsen)->get("absen")->row();

            if($data != null){
                if($data->STATUS_ABSEN == 1){
                    $response["error"] = true;
                    $response["message"] = "Attendance has been sent";
                    $this->throw(200, $response);
                    return;
                }

                $this->db->query("UPDATE absen SET STATUS_ABSEN = 1, NOTE_ABSEN = '".$note."' WHERE ID_ABSEN= '".$idAbsen."'");
                if($this->db->affected_rows() > 0){
                    $response["error"] = false;
                    $response["message"] = "Send Attendance successfully";
                    $this->throw(200, $response);
                    return;
                }

                $response["error"] = true;
                $response["message"] = "Error found";
                $this->throw(200, $response);
                return;
            }
    }

    public function generate(){

        $response = [];

        $sixdigit = $this->sixdigit();
        $id = $this->input->post('id_jadwal');
        $nip = $this->input->post('nip');
        $topik = $this->input->post('topik');
        $metode = $this->input->post('metode');
        $tipe = $this->input->post('tipe');
        $latitude = $this->input->post('latitude');
        $longitude = $this->input->post('longitude');

        date_default_timezone_set('Asia/Jakarta'); # add your city to set local time zone
        $now = date('Y-m-d H:i:s');
        
        $config['cacheable']        = true; //boolean, the default is true
        $config['cachedir']     = './assets/'; //string, the default is application/cache/
        $config['errorlog']     = './assets/'; //string, the default is application/logs/
        $config['imagedir']     = './assets/images/qr/'; //direktori penyimpanan qr code
        $config['quality']      = true; //boolean, the default is true
        $config['size']         = '1024'; //interger, the default is 1024
        $config['black']        = array(224,255,255); // array, default is array(255,255,255)
        $config['white']        = array(70,130,180); // array, default is array(0,0,0)
        $this->ciqrcode->initialize($config);
     
        $image_name = $sixdigit.'.png'; //buat name dari qr code sesuai dengan nim
     
        $params['data']         = $sixdigit; //data yang akan di jadikan QR CODE
        $params['level']        = 'H'; //H=High
        $params['size']         = 10;
        $params['savename']     = FCPATH.$config['imagedir'].$image_name; //simpan image QR CODE ke folder assets/images/
        $this->ciqrcode->generate($params); // fungsi untuk generate QR CODE

        $datakelas = array(
            "ID_ABSEN" => $sixdigit,
            "ID_JADWAL" => $id,
            "NIP_DOSEN" => $nip,
            "TOPIK_ABSEN" => $topik,
            "METODE_ABSEN" => $metode,
            "JENIS_ABSEN" => $tipe,
            "LONG_ABSEN" => $longitude,
            "LAT_ABSEN" => $latitude,
            "TS_ABSEN" => $now,
            "STATUS_ABSEN" => 0
        );
            
            $this->db->insert("absen",$datakelas);
            
            $getmhs = $this->db->query("SELECT perwalian.NRP_MHS, mahasiswa.NAMA_MHS, mahasiswa.EMAIL_MHS FROM perwalian JOIN mahasiswa ON perwalian.NRP_MHS = mahasiswa.NRP_MHS WHERE perwalian.ID_JADWAL = '".$id."'")->result_array();

            $detailAbsenMhs = array();

            foreach($getmhs as $mhs){
				$dataDetailAbsen["ID_DETABSEN"] = $this->serial_meeting();
	 			$dataDetailAbsen["ID_ABSEN"] = $sixdigit;
				$dataDetailAbsen["NRP_MHS"] = $mhs["NRP_MHS"];
				$dataDetailAbsen["STATUS_DETABSEN"] = 0;
				$dataDetailAbsen["TS_DETABSEN"] = null;

	      		$detailAbsenMhs[] = $dataDetailAbsen;
	 		}
            
            $this->db->insert_batch("detail_absen", $detailAbsenMhs);
            
            if($this->db->affected_rows() > 0){
                $mhs = $this->db->query("SELECT detail_absen.NRP_MHS, mahasiswa.NAMA_MHS, mahasiswa.EMAIL_MHS, detail_absen.STATUS_DETABSEN FROM detail_absen JOIN mahasiswa ON detail_absen.NRP_MHS = mahasiswa.NRP_MHS WHERE detail_absen.ID_ABSEN = '".$sixdigit."'")->result();
                
                $detail_kelas = $this->db->query("SELECT matakuliah.KODE_MATKUL, matakuliah.KODE_PRODI, matakuliah.NAMA_MATKUL, pertemuan.KELAS_PRTMN FROM matakuliah JOIN pertemuan ON matakuliah.KODE_MATKUL = pertemuan.KODE_MATKUL JOIN jadwal ON pertemuan.ID_PRTMN = jadwal.ID_PRTMN WHERE jadwal.ID_JADWAL = '".$id."'")->result();

                $response["error"] = false;
                $response["message"] = "QR Code generated";
                $response["id_absen"] = $sixdigit;
                $response["url"] = base_url('assets/images/qr/'.$sixdigit.'.png');
                $response["data_mhs"] = $mhs;
                $response["detail_kelas"] = $detail_kelas;
    
                $this->throw(200, $response);
                return;
            }else{
            $response["error"] = true;
            $response["message"] = "QR Failed";
            $this->throw(200, $response);
        }
    }
    
    public function reGenerate(){
        $response = [];
        
        $id = $this->input->post('id_jadwal');
            
            $getid = $this->db->query("SELECT ID_ABSEN FROM absen WHERE ID_JADWAL = '".$id."' AND STATUS_ABSEN = 0")->row();
        
            $data = $this->db->query("SELECT detail_absen.NRP_MHS, mahasiswa.NAMA_MHS, mahasiswa.EMAIL_MHS, detail_absen.STATUS_DETABSEN FROM detail_absen JOIN mahasiswa ON detail_absen.NRP_MHS = mahasiswa.NRP_MHS WHERE detail_absen.ID_ABSEN = '".$getid->ID_ABSEN."'")->result();
            $detail_kelas = $this->db->query("SELECT matakuliah.KODE_MATKUL, matakuliah.KODE_PRODI, matakuliah.NAMA_MATKUL, pertemuan.KELAS_PRTMN FROM matakuliah JOIN pertemuan ON matakuliah.KODE_MATKUL = pertemuan.KODE_MATKUL JOIN jadwal ON pertemuan.ID_PRTMN = jadwal.ID_PRTMN WHERE jadwal.ID_JADWAL = '".$id."'")->result();

                $response["error"] = false;
                $response["message"] = "QR Code found";
                $response["id_absen"] = $getid->ID_ABSEN;
                $response["url"] = base_url('assets/images/qr/'.$getid->ID_ABSEN.'.png');
                $response["data_mhs"] = $data;
                $response["detail_kelas"] = $detail_kelas;
    
                $this->throw(200, $response);
                return;
    }

    public function sixdigit(){
        $randomdigit = random_string('alnum',6);

        // echo $randomdigit;
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

    private function throw($statusCode, $response){
        $this->output->set_status_header($statusCode)
        ->set_content_type('application/json')
        ->set_output(json_encode($response));
    }
}
