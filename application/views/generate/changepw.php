<div class="py-1">
  <div class="container">
    <div class="row">
    </div>
  </div>
</div>
<div class="py-4">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="col-md-6">
            <div class="card mx-auto">
                <div class="card-header text-white text-center bg-success" >Form Ubah Password</div>
                <form  action="<?php echo base_url('Generate/changepass') ?>" method="POST">
                  <div class="card-body form-group">

                    <?php if ($this->session->flashdata('error_change')){ ?>
                    <div class="alert alert-danger" role="alert">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <p class="mb-0"><?= $this->session->flashdata('error_change') ?></p>
                    </div>
                    <?php }else if($this->session->flashdata('success_change')) {?>
                    <div class="alert alert-success" role="alert">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <p class="mb-0"><?= $this->session->flashdata('success_change') ?></p>
                    </div>
                    <?php } ?>


                      <label>Password Lama</label>
                      <input id="old" class="form-control" type="password" name="old" required>
                      <label>Password Baru</label>
                      <input id="new" class="form-control" type="password" name="new" required>
                      <label>Password Baru (konfirmasi)</label>
                      <input id="confirm" class="form-control" type="password" name="confirm" required>
                      <button type="submit" class="btn btn-sm btn-success" style="margin: 20px 10px;">Simpan</button>
                      <button type="reset" class="btn btn-sm btn-danger" style="margin: 20px 10px;">Cancel</button>
                  </div>
                </form>
            </div>
        </div>
      </div>
  </div>
</div>