<div class="py-1">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <!-- <h3 class="display-3">Ubah Data Backend User</h3> -->
      </div>
    </div>
  </div>
</div>
<?php if ($this->session->flashdata('error_message')){ ?>
<div class="py-1">
  <div class="container">
    <div class="alert alert-danger" role="alert">
      <h4 class="alert-heading">Oh snap!<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></h4>
      <p><?= $this->session->flashdata('error_message') ?></p>
    </div>
  </div>
</div>
<?php } ?>
<div class="py-1">
  <div class="container">
    <div class="alert alert-primary" role="alert">
      <p><b>Informasi!</b> Field yang ditandai harus diisi dengan benar.</p>
    </div>
  </div>
</div>
<div class="py-4">
  <div class="container">
    <form id="c_form-h" method="post" action="<?= base_url('Mahasiswa/update'); ?>" enctype="multipart/form-data">
      <div class="form-group row"> 
        <label for="nrp" class="col-2 col-form-label">NRP*</label>
        <div class="col-3">
          <input type="text" class="form-control" name="nrp" value="<?= $mhs->NRP_MHS ?>" readonly> 
        </div>
      </div>
      <div class="form-group row">
        <label for="nama" class="col-2 col-form-label">Nama*</label>
        <div class="col-5">
          <input type="text" class="form-control" name="nama" value="<?= $mhs->NAMA_MHS ?>">
        </div>
      </div>
     <div class="form-group row">
        <label for="email" class="col-2 col-form-label">Email*</label>
        <div class="col-5">
          <input type="email" class="form-control" name="email" value="<?= $mhs->EMAIL_MHS ?>">
        </div>
      </div>
      <div class="form-group row">
        <label for="reset" class="col-2 col-form-label">Reset Konfigurasi</label>
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="checkbox" name="reset" id="reset">
          <label for="reset" class="form-check-label"> <b>Note :</b> Data Device, dan Login akan dihapus ulang</label>
        </div>
      </div>
      <button type="submit" class="btn btn-primary">Ubah Data</button>
    </form>
  </div>
</div>