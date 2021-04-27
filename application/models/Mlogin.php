<?php
class Mlogin extends CI_Model {
  public function __construct() {
    parent::__construct();
    $this->load->database();
  }

  public function auth($user,$pass){
    $query = $this->db->where("NIP_DOSEN", $user)->where("PASS_DOSEN", $pass)->get("dosen");
    return $query->result();
  }

}
?>