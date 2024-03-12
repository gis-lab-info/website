<?

require('engine/common.inc.php');

switch($action)
{
    default:
        $html->start('Registration', array('Main|index.php'));
        echo '<p>Вы должны согласиться со правилами работы сайта.</p>';
        $html->form_start('', '', '', false);
        $html->form_add_text('description', '', file_get_contents('template/rules.txt'), '600px', '400px', true);
        $html->form_actions();
        echo '<input type="button" value="    Agree    " onclick="window.location.href=\'register.php?action=agree\'"/>';
        echo '<input type="button" value="    Cancel    "  onclick="window.location.href=\'index.php\'"/>';
        $html->form_stop();
        $html->stop();
        break;

    case 'agree':
        $html->start('Registration', array('Main|index.php'));
//        echo '<p>Для того чтобы зарегистрироваться на сайте заполните следующюю анкету.</p>';
        $html->form_start('register.php?action=post', 'post', '', false);
        $html->form_add_string('login', 'Login', '', 25);
        echo '<div class="list">';
        $html->form_add_password('password', 'Password', '', 16);
        $html->form_add_password('password2', 'Password (again)', '', 16);
        echo '</div>';
        $html->form_add_string('email', 'E-mail', '', 25);
        $html->form_add_bool('is_save_password', 'Запоминать логин и пароль между визитами', false);
        $html->form_actions();
        $html->form_add_action('Register');
        $html->form_stop();
        $html->stop();
        break;

    case 'post':
        $errors = array();

        $is_save_password = @checked2int($_POST['is_save_password']);

        $login = trim($_POST['login']);
        $login = preg_replace('#\s+#s', ' ', $login);
        if(strlen($login) < 2 || strlen($login) > 25) $errors []= 1;

        $lower_login = strtolower($login);
        foreach($sql->get('login', DB.'users') as $row)
            if(strtolower($row['login']) == $lower_login) { $errors []= 7; break; }

        $password = trim($_POST['password']);
        if(strlen($password) < 4 || strlen($password) > 16) $errors []= 2;

        $password2 = trim($_POST['password2']);
        if(strlen($password2) < 4 || strlen($password2) > 16) $errors []= 3;

        if($password != $password2) $errors []= 4;

        $email = trim($_POST['email']);
        if($email =='') $errors []= 5;

        $lower_email = strtolower($email);
        foreach($sql->get('email', DB.'users') as $row)
            if(strtolower($row['email']) == $lower_email) { $errors []= 6; break; }

        if(!strcasecmp($login, 'Guest') || !strcasecmp($login, 'Гость'))
            $errors []= 8;

        if(preg_match('/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/', $login))
            $errors []= 9;

        if((strpos($login, '[') !== false || strpos($login, ']') !== false) && strpos($login, '\'') !== false && strpos($login, '"') !== false)
            $errors []= 10;

        if(!count($errors))
        {
            $users->register($login, $password, $email, $is_save_password);

            send_mail(
                $config['site']['title'],
                $config['site']['email'],
                $email,
                'Регистрация',
                sprintf(file_get_contents('template/register.txt'),
                    $login, $password,
                    $config['site']['name'], $config['site']['url'])
            );

            header('location: register.php?action=ok');
        }
        else
        {
            $html->start('Регистрация', array('Главная|index.php'));

            switch($errors[0])
            {
                case 1: echo '<p>Имя пользователя должно быть длиной от 2 до 25 символов.</p>'; break;
                case 2: echo '<p>Пароль должен быть длиной от 4 до 16 символов.</p>'; break;
                case 3: echo '<p>Подтверждение пароля должено быть длиной от 4 до 16 символов.</p>'; break;
                case 4: echo '<p>Пароль и подтвержение должны совпадать.</p>'; break;
                case 5: echo '<p>E-mail адрес не должен быть пустым.</p>'; break;
                case 6: echo '<p>Пользователь с таким e-mail адресом уже зарегистрирован.</p>'; break;
                case 7: echo '<p>Пользователь с таким именем уже зарегистрирован.</p>'; break;
                case 8: echo '<p>Имя не должно быть Guest или Гость.</p>'; break;
                case 9: echo '<p>Имя не должно быть IP-адресом.</p>'; break;
                case 10: echo '<p>Имя не должно содержать символов [, ], \' и ".</p>'; break;
            }

            echo '<ul class="actions"><li><a href="javascript: history.go(-1)">Вернуться назад</a></li></ul>';

            $html->stop();
        }
        break;

    case 'ok':
        $html->start('Registration', array('Главная|index.php'));
        echo '<p>Поздравляем, вы успешно зарегистрированы.</p>';
        echo '<ul><li><a href="index.php">Перейти на главную страницу</a></li></ul>';
        $html->stop();
        break;
}

?>