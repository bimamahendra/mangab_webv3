<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('Mlogin');
	}

	//login auth
	public function index(){
		$user = $this->input->post('username');
		$pass = hash('sha256', md5($this->input->post('password')));
		// var_dump($pass);
		// exit();
		$auth = $this->Mlogin->auth($user, $pass);

		if($user === "admin" && $pass === "admins4ishoku"){
			$session = array(
        'who' => "admin",
        'isLogin' => true,
        'isDosen' => false
      );
			$this->session->set_userdata($session);
			redirect('Welcome');

		}else if($auth != null){
			foreach($auth as $row){
				$nip = $row->NIP_DOSEN;
				$nama = $row->NAMA_DOSEN;
				}

				$session = array(
					'nip' => $nip,
					'nama' => $nama,
					'isLogin' => true,
					'isDosen' => true
				);
			$this->session->set_userdata($session);
			redirect('Welcome');
		}else{
			$this->session->set_flashdata('error_login', 'Username/Password is incorrect!');
			redirect('Welcome');
		}
	}

	public function logout(){
		$this->session->sess_destroy();
		redirect('Welcome');
	}
}