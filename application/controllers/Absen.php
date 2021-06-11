<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Absen extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('Mabsen');
	}

	public function index(){
		$param['main_content'] = 'absen/list';
		$param['page_title'] = 'Daftar Perkuliahan';
		$param['absen_list'] = $this->Mabsen->getAllAbsen();
		$this->load->view('dashboard', $param);
	}

	//verifikasi admin, ketika kelas sudah direkap oleh dosen
	public function verif($id){
		$cek = $this->Mabsen->verifAbsen($id);
		if($cek > 0){
			$this->session->set_flashdata('success_message', 'Data rekap berhasil diverifikasi');
			redirect('Absen');
		}else{
			$this->session->set_flashdata('error_message', 'Data rekap gagal diverifikasi');
			redirect('Absen');
		}
	}

	//get list status kehadiran mahasiswa
	public function det_absen($id){
		$param['main_content'] = 'absen/detail';
		$param['page_title'] = 'Detail Absensi';
		$param['detail_list'] = $this->Mabsen->getAbsen($id);
		$param['detail_note'] = $this->Mabsen->getNote($id);
		$this->load->view('dashboard', $param);
	}

	public function delete($idAbsen){
		$this->Mabsen->delete($idABsen);
		$this->session->set_flashdata('success_message', 'Data presensi berhasil dihapus');
		redirect('Absen');
	}
}