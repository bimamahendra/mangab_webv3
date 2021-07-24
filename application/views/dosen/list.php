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
          <table class="table table-striped table-borderless" id="newstable">
            <thead>
              <tr>
                <th class="text-center">NIP</th>
                <th class="text-center">Nama</th>
                <th class="text-center">Email</th>
                <th class="text-center">Status Pass</th>
                <th class="text-center" style="width: 50px">Aksi</th>
              </tr>
            </thead>
            <tbody>
              <?php $i = 1;
              foreach ($dosen_list as $dosen){ ?>
                <tr>
                  <td class="text-center"><?php echo $dosen->NIP_DOSEN; ?></td>
                  <td class="text-left"><?php echo $dosen->NAMA_DOSEN ?></td>
                  <td class="text-left"><?php echo $dosen->EMAIL_DOSEN; ?></td>
                  <td class="text-center"><?php echo isset ($dosen->STATUS_PASS) ? $dosen->STATUS_PASS : "0" ?></td>
                  <td class="text-center">
                    <a href="<?= base_url('Dosen/edit_dosen/' . $dosen->NIP_DOSEN) ?>"><i class="fa fa-pencil text-secondary"></i></a>
                    <a href="#" data-toggle="modal" data-target="#ModalDelete" data-id="<?php echo $dosen->NIP_DOSEN; ?>"
                        data-title="<?php echo $dosen->NIP_DOSEN; ?>" class="mdl_delete"><i class="fa fa-trash text-danger"></i></a>
                  </td>
                </tr>
              <?php $i++; } ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="ModalDelete" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Konfirmasi Penghapusan</h5> <button type="button" class="close" data-dismiss="modal"> <span>×</span> </button>
      </div>
      <div class="modal-body">
        <p>Anda yakin ingin menghapus data dosen yang dipilih?</p>
        <p id="dosentitle"></p>
      </div>
      <div class="modal-footer"> 
      <a id="confirm_delete" class="btn btn-danger">Delete</a>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> 
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script>
$('#newstable tbody').on('click', '.mdl_delete', function () {
    var absen_id = $(this).data('id')
    $('#confirm_delete').attr('href', '<?= base_url('Dosen/delete/')?>'+absen_id)
})
</script>