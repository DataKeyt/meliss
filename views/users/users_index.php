<? if (!$auth->is_admin): ?>
    <div class="alert alert-danger fade in">
        <button class="close" data-dismiss="alert">×</button>
        You are not an administrator.
    </div>
    <? exit(); endif; ?>

<h3>Users</h3>
<ul class="list-group">
    <? foreach ($users as $user): ?>
        <li class="list-group-item"><a
                href="users/view/<?= $user['user_id'] ?>/<?= $user['username'] ?>"><?= $user['username'] ?></a></li>
    <? endforeach ?>
</ul>

<?php if ($auth->is_admin): ?>
<h3>Add new user</h3>

<form method="post" id="form">
    <form id="form" method="post">
        <table class="table table-bordered">
            <tr>
                <th>Username</th>
                <td><input type="text" name="data[username]" placeholder="Jaan"/></td>
            </tr>
            <tr>
                <th>Password</th>
                <td><input type="text" name="data[password]" placeholder="******"/></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><input type="text" name="data[name]" placeholder="Jaan Taam"/></td>
            </tr>
            <tr>
                <th>Active</th>
                <td><input type="checkbox"
                           name="data[active]" checked="checked"/>
            </tr>
            <tr>
                <th>Email</th>
                <td><input type="text" name="data[email]" placeholder="em@ail.ee">
            </tr>
            <tr>
                <th>Telefon</th>
                <td><input type="text" name="data[telefon]" placeholder="55555555">
            </tr>
        </table>

        <button class="btn btn-primary" type="submit">Add</button>
    </form>
    <?php endif; ?>
