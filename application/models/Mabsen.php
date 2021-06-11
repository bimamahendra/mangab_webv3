<?php
class Mabsen extends CI_Model {
  public function __construct() {
    parent::__construct();
    $this->load->database();
  }

  public function getAllAbsen(){
    $query = $this->db->query("SELECT absen.ID_ABSEN, dosen.NAMA_DOSEN, matakuliah.NAMA_MATKUL, absen.TOPIK_ABSEN, absen.METODE_ABSEN, absen.TS_ABSEN, absen.STATUS_ABSEN FROM absen
    JOIN jadwal ON absen.ID_JADWAL = jadwal.ID_JADWAL
    JOIN pertemuan ON pertemuan.ID_PRTMN = jadwal.ID_PRTMN
    JOIN matakuliah ON matakuliah.KODE_MATKUL = pertemuan.KODE_MATKUL
    JOIN dosen ON dosen.NIP_DOSEN = absen.NIP_DOSEN ORDER BY (absen.TS_ABSEN) DESC");
    return $query->result();
  }

  public function verifAbsen($id){
    $this->db->query("UPDATE absen SET STATUS_ABSEN = 2 WHERE ID_ABSEN = '".$id."'");
    return $this->db->affected_rows();
  }

  public function getAbsen($id){
    $query = $this->db->query("SELECT absen.ID_ABSEN, detail_absen.NRP_MHS, mahasiswa.NAMA_MHS, detail_absen.STATUS_DETABSEN, detail_absen.TS_DETABSEN FROM absen
    JOIN detail_absen ON absen.ID_ABSEN = detail_absen.ID_ABSEN
    JOIN mahasiswa ON detail_absen.NRP_MHS = mahasiswa.NRP_MHS
    WHERE detail_absen.ID_ABSEN = '".$id."'
    ORDER BY (detail_absen.NRP_MHS) ASC");
    return $query->result();
  }

  public function getNote($id){
    $query = $this->db->query("SELECT NOTE_ABSEN FROM absen WHERE ID_ABSEN = '".$id."'");
    return $query->result();
  }

  public function delete($id){
    $query = $this->db->query("DELETE FROM detail_absen WHERE ID_ABSEN = '".$id."'");
    $query = $this->db->query("DELETE FROM absen WHERE ID_ABSEN = '".$id."'");
    return TRUE;
  }

  public function stat(){
    $query = $this->db->query("SELECT SUM(STATUS_DETABSEN = 0) AS a, SUM(STATUS_DETABSEN = 1) AS m, SUM(STATUS_DETABSEN = 2) AS s, SUM(STATUS_DETABSEN = 3) AS i FROM detail_absen");
    return $query->result();
  }
}
?>