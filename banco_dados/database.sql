
-- Banco de dados IceMath

CREATE DATABASE IF NOT EXISTS ice_math
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE ice_math;

=============================================
-- Tabela: usuarios
-- Armazena os dados dos cadastros de usuário
=============================================
CREATE TABLE IF NOT EXISTS usuarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(60) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    serie_aluno TINYINT NOT NULL,
    foto_url VARCHAR(500) NULL DEFAULT NULL,
    criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

=============================================
-- Tabela: persistência_login
-- Token para manter o login do usuário
=============================================
CREATE TABLE IF NOT EXISTS login_persistente (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED NOT NULL,
    seletor CHAR(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
    validador_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
    criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expira_em DATETIME NOT NULL,
    CONSTRAINT fk_login_persistente_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT uq_login_persistente_seletor UNIQUE (seletor),
    INDEX idx_login_persistente_usuario (usuario_id),
    INDEX idx_login_persistente_expiracao (expira_em)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

=============================================
-- Tabela: tentativas_login
-- Protege o login do usuário de muitas tentativas de acesso
=============================================
CREATE TABLE IF NOT EXISTS tentativas_acesso (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(30) NOT NULL,
    chave VARCHAR(190) NOT NULL,
    criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_tentativas (tipo, chave, criado_em)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




