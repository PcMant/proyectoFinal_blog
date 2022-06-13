<?php
$pass = !empty($_POST['pass']) ? $_POST['pass']: '';
$crypt = crypt($pass, '$2a$07$azybxcags23425sdg23sdfhsd$');

echo '<h1>Generador hash de password</h1>';
    
echo "
    <form method='post' action=''>
        <input type='text' name='pass' value='$pass' />
        <input type='submit' name='enviar' value='Gemerar contraseña' />
    </form>
";

echo "<p>Hash de password: $crypt</p>";

?>