<?php
class Mmhs extends CI_Model {
  public function __construct() {
    parent::__construct();
    $this->load->database();
  }

  public function getAllMhs(){
    return $this->db->get('mahasiswa')->result();
  }

  public function getMhs($nrp){
    return $this->db->where('NRP_MHS', $nrp)->get('mahasiswa')->row();
  }

  public function insert($data){
    $this->db->insert('mahasiswa', $data);
    return TRUE;
  }

  public function update($nrp, $data){
    $this->db->where('NRP_MHS', $nrp)->update('mahasiswa', $data);
    return $this->db->affected_rows();
  }

  public function delete($nrp){
    $this->db->where('NRP_MHS', $nrp)->delete('mahasiswa');
    return $this->db->affected_rows();
  }
}
?>