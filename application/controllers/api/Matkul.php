<?php
defined('BASEPATH') OR exit('No direct script access allowed');

date_default_timezone_set("Asia/Jakarta");

class Matkul extends CI_Controller {

    function __construct()
    {
        parent::__construct();
        $this->load->library("encryption");
        $this->load->database();
    }

    public function myLecture(){
        $response = [];

        $nip = $this->input->post('nip');
        
        $data = $this->db->query("SELECT pertemuan.KODE_MATKUL,
				matakuliah.NAMA_MATKUL,
				pertemuan.KELAS_PRTMN,
				jadwal.RUANG_KELAS,
				jadwal.ID_JADWAL,
				jadwal.HARI_KELAS,
				DATE_FORMAT(jadwal.WAKTU_AWAL, '%H:%i') as WAKTU_AWAL,
				DATE_FORMAT(jadwal.WAKTU_AKHIR, '%H:%i') as WAKTU_AKHIR,
				
				SUM(if(absen.STATUS_ABSEN = 0, 1, 0)) AS check_active
        		FROM pengampu
                JOIN pertemuan ON pengampu.ID_PRTMN = pertemuan.ID_PRTMN
                JOIN jadwal ON pertemuan.ID_PRTMN = jadwal.ID_PRTMN
                JOIN matakuliah ON pertemuan.KODE_MATKUL = matakuliah.KODE_MATKUL
    		    LEFT JOIN absen ON absen.ID_JADWAL = jadwal.ID_JADWAL
                WHERE pengampu.NIP_DOSEN = '".$nip."' GROUP BY jadwal.ID_JADWAL ORDER BY(check_active) DESC")->result();

        if(count($data) > 0){
            $response["error"] = false;
            $response["message"] = "Subject found";
            $response["data"] = $data;
            $this->throw(200, $response);
            return;
        }

        $response["error"] = true;
        $response["message"] = "You are not in any subject";
        $this->throw(200, $response);
    }

    public function myClass(){
        $response = array();

        $kode = $this->input->post("kode_matkul");

        $data = $this->db->query("SELECT ID_MATKUL as id_matkul, KELAS_MATKUL as kelas FROM matkul WHERE KODE_MATKUL='".$kode."'")->result();
        if(count($data) > 0){
            $response["error"] = false;
            $response["message"] = "Subject found";
            $response["data"] = $data;

            $this->throw(200, $response);
            return;
        }

        $response["error"] = true;
        $response["message"] = "Subject is not registered";
        $this->throw(200, $response);
    }

    private function throw($statusCode, $response){
        $this->output->set_status_header($statusCode)
        ->set_content_type('application/json')
        ->set_output(json_encode($response));
    }
}
