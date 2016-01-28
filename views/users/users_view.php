<h1>User '<?= $user['username'] ?>'</h1>
<table class="table table-bordered">
    <tr>
        <th>Nimi</th>
        <td><?= $user['name'] ?></td>
    </tr>
    <tr>
        <th>Email</th>
        <td><?= $user['email'] ?></td>
    </tr>
    <tr>
        <th>Telefon</th>
        <td><?= $user['telefon'] ?></td>
    </tr>
</table>

<!-- EDIT BUTTON -->
<? if ($auth->is_admin): ?>
    <form action="users/edit/<?= $user['user_id'] ?>">
        <div class="pull-right">
            <button class="btn btn-primary">
                Edit
            </button>
        </div>
    </form>
<? endif; ?>