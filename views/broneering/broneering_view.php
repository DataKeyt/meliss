<h1>Broneering '<?= $broneering['kuupaev'] . " " . $broneering['kellaeg'] ?>'</h1>
<table class="table table-bordered">
    <tr>
        <th>Millal?</th>
        <td><?= $broneering['kuupaev'] . " " . $broneering['kellaeg'] ?></td>
    </tr>
    <tr>
        <th>Kes?</th>
        <td><a href="users/view/<?= $broneering['user_id'] ?>"><?= $broneering['name'] ?></a></td>
    </tr>
    <tr>
        <th>Mitu inimest?</th>
        <td><?= $broneering['inimeste_arv'] ?></td>
    </tr>
    <tr>
        <th>Mitu rooga?</th>
        <td><?= $broneering['eelrooga_arv'] . " eelrooga, " . $broneering['pohirooga_arv'] . " põhirooga ja " . $broneering['jarelrooga_arv'] . " järelrooga"?></td>
    </tr>

</table>

<!-- EDIT BUTTON -->
<? if ($auth->is_admin): ?>
    <form action="broneering/edit/<?= $broneering['broneering_id'] ?>">
        <div class="pull-right">
            <button class="btn btn-primary">
                Edit
            </button>
        </div>
    </form>
<? endif; ?>