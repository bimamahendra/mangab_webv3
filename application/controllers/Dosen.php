<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dosen extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('Mdosen');
	}

	public function index(){
		$param['main_content'] = 'dosen/list';
		$param['page_title'] = 'Daftar Dosen';
		$param['dosen_list'] = $this->Mdosen->getAllDosen();
		$this->load->view('dashboard', $param);
	}

	public function edit_dosen($nip){
		$data['main_content'] = 'dosen/edit';
		$data['page_title'] = 'Edit Data Dosen';
		$data['dosen'] = $this->Mdosen->getDosen($nip);
		$this->load->view('dashboard', $data);
	}

	//reset akun dosen
	public function update(){
		$nip 	= $this->input->post('nip');
		$nama = $this->input->post('nama');
		$email = $this->input->post('email');
		$reset = $this->input->post('reset');
		if (empty($nip) || empty($nama) || empty($email)) {
			$this->session->set_flashdata('error_message', 'Harap masukkan data dengan benar!');
			redirect('Dosen/edit_dosen/'.$nip);
		} else {
			$data = [
				'NIP_DOSEN' => $nip, 
				'NAMA_DOSEN' => $nama,
				'EMAIL_DOSEN' => $email,
				];
				$this->Mdosen->update($nip, $data);
				if($reset == "on"){
					$data = [
						'PASS_DOSEN' => hash('sha256', md5('stikimalang')),
						'STATUS_PASS' => 0,
						'STATUS_LOGIN' => 0
					];
					$this->Mdosen->update($nip, $data);
				}

				$this->session->set_flashdata('success_message', 'Data dosen berhasil diubah');
				redirect('Dosen');
		}
	}

	public function delete($nip){
		$this->Mdosen->delete($nip);
		$this->session->set_flashdata('success_message', 'Data dosen berhasil dihapus');
		redirect('Dosen');
	}
}