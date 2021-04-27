<?php
class Mgenerate extends CI_Model {
  public function __construct() {
    parent::__construct();
    $this->load->database();
  }

  public function stats($nip){
  	$query = $this->db->query('SELECT matkul.NAMA_MATKUL, matkul.KELAS_MATKUL, COUNT(matkul.ID_MATKUL) AS jumlah FROM absen JOIN matkul ON absen.ID_MATKUL = matkul.ID_MATKUL WHERE matkul.NIP_DOSEN = '.$nip.' GROUP BY matkul.ID_MATKUL');
  	return $query->result();
  }

  public function getAllMatkulByNIP($nip){
  	return $this->db->where('NIP_DOSEN', $nip)->get('matkul')->result();
  }

  public function getMatkulByID($id){
  	return $this->db->where('ID_MATKUL', $id)->get('matkul')->result();
  }

  public function cekstatabsen($nip, $id){
  	$query = $this->db->query('SELECT a.ID_ABSEN FROM absen a JOIN matkul m ON a.ID_MATKUL = m.ID_MATKUL JOIN dosen d ON m.NIP_DOSEN = d.NIP_DOSEN WHERE d.NIP_DOSEN = "'.$nip.'" AND a.STATUS_ABSEN = 0 AND a.ID_MATKUL = "'.$id.'"')->row();
  	return $query;
  }

  public function cekrand($rand){
  	return $this->db->query("SELECT ID_ABSEN FROM absen WHERE ID_ABSEN = '.$rand.'")->num_rows();
  }

  public function saveqr($data){
  	$query = $this->db->insert("absen",$data);
  	return TRUE;
  }

  public function getmhs($id){
  	$query = $this->db->query("SELECT a.NRP_MHS as nrp, b.NAMA_MHS as nama, b.EMAIL_MHS as email FROM ambilmk a JOIN mahasiswa b ON b.NRP_MHS = a.NRP_MHS WHERE a.ID_MATKUL = '".$id."' ");
  	return $query->result_array();
  }

  public function savedet($data){
  	$this->db->insert_batch('detail_absen', $data);
  	return $this->db->affected_rows();
  }

  public function getkelas($qr){
    return $this->db->query("SELECT a.NRP_MHS as nrp, b.NAMA_MHS as nama, b.EMAIL_MHS as email, a.STATUS_DETABSEN as status_absen FROM detail_absen a JOIN mahasiswa b ON b.NRP_MHS = a.NRP_MHS WHERE a.ID_ABSEN = '".$qr."' ")->result();
  }

  public function getjmlmhs($qr){
    $query =  $this->db->query("SELECT COUNT(a.NRP_MHS) AS jml FROM detail_absen a JOIN mahasiswa b ON b.NRP_MHS = a.NRP_MHS WHERE a.ID_ABSEN = '".$qr."' ")->row();
    return $query->jml;
  }

  public function getrecap($qr){
    return $this->db->query("SELECT d.NRP_MHS, m.NAMA_MHS, d.STATUS_DETABSEN FROM detail_absen d JOIN mahasiswa m ON d.NRP_MHS = m.NRP_MHS WHERE d.ID_ABSEN = '".$qr."' AND d.STATUS_DETABSEN = 0 ")->result();
  }

  public function updaterekap($qr, $nrp, $stat){
    $this->db->set('STATUS_DETABSEN', $stat);
    $this->db->where('ID_ABSEN', $qr);
    $this->db->where('NRP_MHS', $nrp);
    $this->db->update('detail_absen');
    return TRUE;
  }

  public function updatenote($note, $qr){
    $this->db->set('NOTE', $note);
    $this->db->set('STATUS_ABSEN', 1);
    $this->db->where('ID_ABSEN', $qr);
    $this->db->update('absen');
    return TRUE;
  }

  public function getdetail($id){
    $this->db->where('ID_MATKUL', $id);
    $this->db->order_by('TS_ABSEN','DESC');
    $this->db->from('absen');
    $query = $this->db->get();
    return $query->result();
  }

  public function getnamamatkul($id){
    $this->db->where('ID_MATKUL',$id);
    $this->db->select('KODE_MATKUL, NAMA_MATKUL');
    $this->db->from('matkul');
    $query = $this->db->get();
    return $query->result();
  }

  public function gethistory($nip){
    $query = $this->db->query("SELECT m.NAMA_MATKUL, m.KELAS_MATKUL, a.TOPIK, a.TS_ABSEN, a.STATUS_ABSEN FROM absen a JOIN matkul m ON a.ID_MATKUL = m.ID_MATKUL WHERE m.NIP_DOSEN = '".$nip."'");
    return $query->result();
  }

  public function cekpass($old){
  	$nip = $this->session->userdata('nip');
  	$this->db->where('PASS_DOSEN', $old);
  	$this->db->where('NIP_DOSEN', $nip);
  	$this->db->from('dosen');
  	$query = $this->db->get();
  	return $query;
  }

  public function changepass($pass){
  	$nip = $this->session->userdata('nip');
  	$this->db->query('UPDATE dosen SET PASS_DOSEN = "'.$pass.'" WHERE NIP_DOSEN = "'.$nip.'"');
  	return TRUE;
  }

}
?>