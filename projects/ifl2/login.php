<?

require('engine/common.inc.php');

switch(@$_GET['action'])
{
    default:
        $html->start('Login', array('Main|index.php'));

        $html->form_start('login.php?action=post', 'post', '', false);
        $html->form_add_string('login', 'Login', '', 25);
        $html->form_add_password('password', 'Password', '', 25);
        $html->form_actions();
        $html->form_add_action('Ok');
        $html->form_stop();

        echo '<ul>';
        echo '<li><a href="register.php">Register</a></li>';
        echo '<li><a href="user_lost_password.php">Lost password?</a></li>';
        echo '</ul>';

        $html->stop();
        break;

    case 'post':
        $errors = array();

        $login = trim($_POST['login']);
        $password = trim($_POST['password']);

        if($users->login($login, $password))
        {
            location('index.php');
        }
        else $errors[] = 1;

        if(!count($errors))
        {
            location('index.php');
        }
        else
        {
            $html->start('Error', array('Main|index.php', 'Login|login.php'));

            switch($errors[0])
            {
                case 1: echo '<p>Пользователей с таким именем или паролем не зарегистрировано.</p>'; break;
            }

            echo '<ul>';
            echo '<li><a href="javascript: history.go(-1)">Попробовать еще раз</a></li>';
//            echo '<li><a href="lost_password.php">Напомнить пароль</a></li>';
            echo '</ul>';

            $html->stop();
        }
        break;
}

?>