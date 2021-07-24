<?php
class Mgenerate extends CI_Model {
  public function __construct() {
    parent::__construct();
    $this->load->database();
  }

  public function stats($nip){
  	$query = $this->db->query("SELECT * FROM pengampu
    JOIN pertemuan ON pengampu.ID_PRTMN = pertemuan.ID_PRTMN
    JOIN jadwal ON pertemuan.ID_PRTMN = jadwal.ID_PRTMN
    JOIN matakuliah ON pertemuan.KODE_MATKUL = matakuliah.KODE_MATKUL
    WHERE pengampu.NIP_DOSEN = '".$nip."'");
  	return $query->result();
  }

  public function getAllMatkulByNIP($nip){
  	$query = $this->db->query("SELECT *, COUNT(ID_JADWAL) AS PERTEMUANKE FROM pengampu
    JOIN pertemuan ON pengampu.ID_PRTMN = pertemuan.ID_PRTMN
    JOIN jadwal ON pertemuan.ID_PRTMN = jadwal.ID_PRTMN
    JOIN matakuliah ON pertemuan.KODE_MATKUL = matakuliah.KODE_MATKUL
    WHERE pengampu.NIP_DOSEN = '".$nip."' GROUP BY ID_JADWAL");
    return $query->result();
  }

  public function getMatkulByID($id){
  	return $this->db->where('ID_MATKUL', $id)->get('matkul')->result();
  }

  public function cekstatabsen($id){
  	$query = $this->db->query("SELECT * FROM `absen` WHERE absen.STATUS_ABSEN = 0 AND absen.ID_JADWAL = '".$id."'")->row();
  	return $query;
  }

  public function cekrand($rand){
  	return $this->db->query("SELECT ID_ABSEN FROM absen WHERE ID_ABSEN = '.$rand.'")->num_rows();
  }

  public function cekserial($rand){
  	return $this->db->query("SELECT ID_DETABSEN FROM detail_absen WHERE ID_DETABSEN = '.$rand.'")->num_rows();
  }

  public function saveqr($data){
  	$query = $this->db->insert("absen",$data);
  	return TRUE;
  }

  public function getmhs($id){
  	$query = $this->db->query("SELECT DISTINCT * FROM mahasiswa JOIN perwalian ON mahasiswa.NRP_MHS = perwalian.NRP_MHS WHERE perwalian.ID_JADWAL = '".$id."'");
  	return $query->result_array();
  }

  public function savedet($data){
  	$this->db->insert_batch('detail_absen', $data);
  	return $this->db->affected_rows();
  }

  public function getkelas($qr){
    return $this->db->query("SELECT * FROM mahasiswa JOIN detail_absen ON mahasiswa.NRP_MHS = detail_absen.NRP_MHS WHERE detail_absen.ID_ABSEN = '".$qr."'")->result();
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
    $this->db->query("UPDATE absen SET STATUS_ABSEN = 1, NOTE_ABSEN = '".$note."' WHERE ID_ABSEN= '".$qr."'");
    return TRUE;
  }

  public function getdetail($id){
    $this->db->where('ID_JADWAL', $id);
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
    $query = $this->db->query("SELECT absen.ID_ABSEN, matakuliah.NAMA_MATKUL, pertemuan.KELAS_PRTMN, absen.TOPIK_ABSEN, absen.METODE_ABSEN, absen.TS_ABSEN, absen.STATUS_ABSEN 
    FROM absen
    JOIN jadwal ON absen.ID_JADWAL = jadwal.ID_JADWAL
    JOIN pertemuan ON pertemuan.ID_PRTMN = jadwal.ID_PRTMN
    JOIN matakuliah ON matakuliah.KODE_MATKUL = pertemuan.KODE_MATKUL
    JOIN pengampu ON pengampu.ID_PRTMN = pertemuan.ID_PRTMN
    WHERE pengampu.NIP_DOSEN = '".$nip."' AND absen.STATUS_ABSEN = 1 ORDER BY (absen.TS_ABSEN) DESC");
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

    //test
  public function sumJadwal($id){
    return $this->db->get_where('absen', array('ID_JADWAL' => $id, 'STATUS_ABSEN' => 1))->num_rows();
  }

}
?>