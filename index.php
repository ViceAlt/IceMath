<?php
require_once __DIR__ . '/topbar.php';
require_once __DIR__ . '/sessao.php';

sessao_iniciar();
$usuario = $_SESSION['usuario'] ?? null;
$fotoInicio = $usuario['foto_url'] ?? '';
if (empty($fotoInicio)) {
    $fotoInicioUrl = 'fotos/foto1.webp';
} elseif (!str_starts_with($fotoInicio, 'http') && !str_starts_with($fotoInicio, '/')) {
    $fotoInicioUrl = ltrim(str_replace('../', '', $fotoInicio), '/');
} else {
    $fotoInicioUrl = $fotoInicio;
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
</head>
<body>
    <div class="top">
        Bem-vindo Nome
    </div>
</body>
</html>