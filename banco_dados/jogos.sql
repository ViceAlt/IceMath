USE ice_math;

=============================================
-- Tabela: jogos
-- Registra os jogos do site e seus dados
-- NÃO APLICADO NEM FINALIZADO 31.10.2026
=============================================
CREATE TABLE IF NOT EXISTS jogos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    pasta_loc VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;