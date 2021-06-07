<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mahasiswa extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('Mmhs');
	}

	public function index(){
		$param['main_content'] = 'mahasiswa/list';
		$param['page_title'] = 'Daftar Mahasiswa';
		$param['mhs_list'] = $this->Mmhs->getAllMhs();
		$this->load->view('dashboard', $param);
	}

	public function edit_mhs($nrp){
		$data['main_content'] = 'mahasiswa/edit';
		$data['page_title'] = 'Edit Data Mahasiswa';
		$data['mhs'] = $this->Mmhs->getMhs($nrp);
		$this->load->view('dashboard', $data);
	}

	//reset akun mahasiswa
	public function update(){
		$nrp 	= $this->input->post('nrp');
		$nama = $this->input->post('nama');
		$email = $this->input->post('email');
		$reset = $this->input->post('reset');
		if (empty($nrp) || empty($nama) || empty($email)) {
			$this->session->set_flashdata('error_message', 'Harap masukkan data dengan benar!');
			redirect('Mahasiswa/edit_mhs/'.$nrp);
		} else {
			$data = [
				'NRP_MHS' => $nrp, 
				'NAMA_MHS' => $nama,
				'EMAIL_MHS' => $email,
				];
				$this->Mmhs->update($nrp, $data);
				if($reset == "on"){
					$data = [
						'PASS_MHS' 		=> hash('sha256', md5('stikimalang')), 
						'ID_DEVICE'	=> NULL,
						'STATUS_LOGIN'	=> 0,
						'STATUS_PASS'	=> 0,
						'LAST_LOGOUT'	=> NULL
						];
					$this->Mmhs->update($nrp, $data);
				}

				$this->session->set_flashdata('success_message', 'Data mahasiswa berhasil diubah');
				redirect('Mahasiswa');
		}
	}

	public function delete($nrp){
		$this->Mmhs->delete($nrp);
		$this->session->set_flashdata('success_message', 'Data mahasiswa berhasil dihapus');
		redirect('Mahasiswa');
	}
}