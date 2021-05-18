<?php
class Mlogin extends CI_Model {
  public function __construct() {
    parent::__construct();
    $this->load->database();
  }

  public function auth($user,$pass){
    $query = $this->db->query("SELECT * FROM dosen WHERE EMAIL_DOSEN = '".$user."' AND PASS_DOSEN = '".$pass."'");
    return $query->result();
  }

}
?>