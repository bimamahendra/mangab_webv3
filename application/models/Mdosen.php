<?php
class Mdosen extends CI_Model {
  public function __construct() {
    parent::__construct();
    $this->load->database();
  }

  public function getAllDosen(){
    $this->db->ordery_by('NIP_DOSEN','ASC');
    return $this->db->get('dosen')->result();
  }

  public function getDosen($nip){
    return $this->db->where('NIP_DOSEN', $nip)->get('dosen')->row();
  }

  public function insert($data){
    $this->db->insert('dosen', $data);
    return TRUE;
  }

  public function update($nip, $data){
    $this->db->where('NIP_DOSEN', $nip)->update('dosen', $data);
    return $this->db->affected_rows();
  }
  
  public function delete($nip){
    $this->db->where('NIP_DOSEN', $nip)->delete('dosen');
    return $this->db->affected_rows();
  }
}
?>