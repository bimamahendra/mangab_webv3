<div class="py-1">
  <div class="container">
    <div class="row">
      <!-- <div class="col-md-12"><h3 class="display-3">Mahasiswa</h3></div> -->
    </div>
  </div>
</div>
<div class="py-0">
  <?php if ($this->session->flashdata('success_message')){ ?>
  <div class="container">
    <div class="alert alert-success" role="alert">
      <h4 class="alert-heading">Sukses!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></h4>
      <p><?= $this->session->flashdata('success_message') ?></p>
    </div>
  </div>
  <?php }
  if ($this->session->flashdata('error_message')){ ?>
  <div class="container">
    <div class="alert alert-danger" role="alert">
      <h4 class="alert-heading">Oh snap!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></h4>
      <p><?= $this->session->flashdata('error_message') ?></p>
    </div>
  </div>
  <?php } ?>
</div>
<div class="py-4">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="table-responsive">
          <table class="table table-striped table-borderless" id="newstable" style="font-size: 15px">
            <thead>
              <tr>
                <th class="text-center">Periode</th>
                <th class="text-center">Kode</th>
                <th class="text-center">Nama Mata Kuliah</th>
                <th class="text-center">Kelas</th>
                <th class="text-center">Hari</th>
                <th class="text-center">Waktu</th>
                <th class="text-center">Ruang</th>
                <th class="text-center">Aksi</th>
              </tr>
            </thead>
            <tbody>
              <?php $i = 1; foreach ($matkul_list as $row) {?>
                <tr>
                  <td class="text-center"><?php echo $row->TANGGAL_MULAI.' s/d '.$row->TANGGAL_AKHIR ?></td>
                  <td class="text-center"><?php echo $row->KODE_MATKUL ?></td>
                  <td><?php echo $row->NAMA_MATKUL ?></td>
                  <td class="text-center"><?php echo $row->KELAS_PRTMN ?></td>
                  <td class="text-center"><?php echo $row->HARI_KELAS ?></td>
                  <td class="text-center"><?php echo date("H:i", strtotime($row->WAKTU_AWAL)).' - '.date("H:i", strtotime($row->WAKTU_AKHIR)) ?></td>
                  <td class="text-center"><?php echo $row->RUANG_PRTMN ?></td>
                  <td class="text-center">
                    <a href="<?php echo base_url('Generate/detail/'.$row->ID_JADWAL) ?>" class="btn btn-sm btn-danger"><i class="fa fa-bars"></i> Detail</a>
                    <!-- <a href="#" onclick="getIDKelas('<?= $row->ID_JADWAL?>')" class="btn btn-sm btn-success"><i class="fa fa-pencil"></i> Buat</a> -->

                    <?php if(($cekkelas->cekstatabsen($row->ID_JADWAL)) != NULL) {
                        $res = $cekkelas->cekstatabsen($row->ID_JADWAL);
                        echo '<a href="'.base_url("Generate/showqr/$res->ID_ABSEN").'" class="btn btn-sm btn-warning"><i class="fa fa-refresh"></i> Lanjutkan</a>';
                      }else{
                        echo '<a href="#" onclick="getIDKelas('.$row->ID_JADWAL.')" class="btn btn-sm btn-success"><i class="fa fa-pencil"></i> Buat</a>';
                      }
                    ?>
                  </td>
                </tr>
              <?php $i++;} ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="ModalTopic" role="dialog" tab-index="-1" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Topik Perkuliahan</h5> <button type="button" class="close" data-dismiss="modal"> <span>×</span> </button>
      </div>

      <form class="form-horizontal" action="<?php echo base_url('Generate/generate') ?>" method="post" enctype="multipart/form-data" role="form">

      <div class="modal-body">
          <div class="md-form">
            <i class="fa fa-thumb-tack text-secondary"></i>
            <label data-error="wrong" data-success="right" for="defaultForm-room">Jenis Kelas</label>
            <br>
            <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="radioJenis" id="inlineRadio1" value="0">
                  <label class="form-check-label" for="inlineRadio1">Offline</label>
            </div>
            <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="radioJenis" id="inlineRadio2" value="1">
                  <label class="form-check-label" for="inlineRadio2">Online</label>
            </div>
            <br><br>
            <i class="fa fa-thumb-tack text-secondary"></i>
            <label data-error="wrong" data-success="right" for="defaultForm-room">Metode</label>
            <input type="text" id="metode" name="metode" class="form-control validate">
            <br>
            <i class="fa fa-thumb-tack text-secondary"></i>
            <label data-error="wrong" data-success="right" for="defaultForm-room">Topik Kelas</label>
            <input type="text" id="topik" name="topik" class="form-control validate">

            <input type="hidden" id="id" name="id">
            <input type="hidden" id="getLat" name="getLat">
            <input type="hidden" id="getLong" name="getLong">

          </div>

          <p id="qrtitle"></p>
        </div>
      <div class="modal-footer"> 
        <button type="submit" id="getLoc" class="btn btn-success">Buat</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button> 
      </div>

      </form>

    </div>
  </div>
</div>


<script>
  function setLoc(position){
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;

    // alert("Latitude : "+latitude+"Longitude : "+longitude);

    $("#getLat").val(latitude);
    $("#getLong").val(longitude);
  }

  function errorHandler(err){
    if(err.code == 1){
      alert("Error : Access denied!");
    }else if(err.code == 2){
      alert("Error : Position is unavailable!");
    }
  }

  function getIDKelas(id_kelas){
    if(navigator.geolocation){
      var options = {timeout:60000};
               navigator.geolocation.getCurrentPosition(setLoc, errorHandler, options);
            } else {
               alert("Sorry, browser does not support geolocation!");
            }

    $("#id").val(id_kelas);
    $("#ModalTopic").modal("show");
  }
</script>
