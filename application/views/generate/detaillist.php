<div class="py-4">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="table-responsive">
          <table class="table table-striped table-borderless" id="newstable">
            <thead>
              <tr>
                <th class="text-center">NRP</th>
                <th class="text-center">Nama Mahasiswa</th>
                <th class="text-center">Status</th>
                <th class="text-center">Timestamp</th>
              </tr>
            </thead>
            <tbody>
              <?php $i = 1;
              foreach ($detail_list as $detail){ ?>
                <tr>
                  <td class="text-center"><?php echo $detail->NRP_MHS; ?></td>
                  <td class="text-left"><?php echo $detail->NAMA_MHS; ?></td>
                  <?php if($detail->STATUS_DETABSEN == 0){ ?>
                    <td class="text-center"><a class="btn btn-sm btn-danger text-white">A</a></td>
                  <?php } else if($detail->STATUS_DETABSEN == 1) {?>
                    <td class="text-center"><a class="btn btn-sm btn-primary text-white">M</a></td>
                  <?php } else if($detail->STATUS_DETABSEN == 2) {?>
                    <td class="text-center"><a class="btn btn-sm btn-info text-white">S</a></td>
                  <?php } else {?>
                    <td class="text-center"><a class="btn btn-sm btn-success text-white">I</a></td>
                  <?php } ?>
                  <td class="text-center"><?php echo $detail->TS_DETABSEN; ?></td>
                </tr>
              <?php $i++; } ?>
            </tbody>
          </table>
        </div>
        <label><b>Note : </b></label>
        <div>
          <textarea class="col-md-12" rows="5" disabled><?php foreach ($detail_note as $note) {echo $note->NOTE_ABSEN;} ?></textarea>
        </div>
      </div>
    </div>
  </div>
</div>