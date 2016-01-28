<? if (!$auth->is_admin): ?>
    <div class="alert alert-danger fade in">
        <button class="close" data-dismiss="alert">×</button>
        You are not an administrator.
    </div>
    <? exit(); endif; ?>
<h1>Broneering</h1>
<form id="form" method="post">
    <table class="table table-bordered">
        <tr>
            <th>Inimeste arv</th>
            <td><input type="text" name="data[inimeste_arv]" value="<?= $broneering['inimeste_arv'] ?>"/></td>
        </tr>
        <tr>
            <th>Eelrooga arv</th>
            <td><input type="text" name="data[eelrooga_arv]" value="<?= $broneering['eelrooga_arv'] ?>"/></td>
        </tr>
        <tr>
            <th>Pohirooga arv</th>
            <td><input type="text" name="data[pohirooga_arv]" value="<?= $broneering['pohirooga_arv'] ?>"/></td>
        </tr>
        <tr>
            <th>Järelrooga arv</th>
            <td><input type="text" name="data[jarelrooga_arv]" value="<?= $broneering['jarelrooga_arv'] ?>"/></td>
        </tr>
    </table>
    <input type="hidden" name="data[broneering_id]" value="<?= $broneering['broneering_id'] ?>"/>
    <input type="hidden" name="data[user_id]" value="<?= $broneering['user_id'] ?>"/>
    <input type="hidden" name="data[kuupaeva_id]" value="<?= $broneering['kuupaeva_id'] ?>"/>
    <input type="hidden" name="data[kellaja_id]" value="<?= $broneering['kellaja_id'] ?>"/>
</form>

<!-- BUTTONS -->
<div class="pull-right">

    <!-- CANCEL -->
    <button class="btn btn-default"
            onclick="window.location.href = 'broneering/view/<?= $broneering['broneering_id'] ?>'">
        Cancel
    </button>

    <!-- DELETE -->
    <button class="btn btn-danger" onclick="delete_broneering(<?= $broneering['broneering_id'] ?>)">
        Delete
    </button>

    <!-- SAVE -->
    <button class="btn btn-primary" onclick="$('#form').submit()">
        Save
    </button>

</div>
<!-- END BUTTONS -->

<script>
    function delete_broneering(broneering_id) {
        $.post("broneering/delete", {broneering_id: <?=$broneering['broneering_id']?>}, function (data) {
            if (data == '1') {
                window.location.href = 'broneering';
            } else {
                alert('Fail');
            }
        });
    }
</script>