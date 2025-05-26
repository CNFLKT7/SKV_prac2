-- 🔐 Создание роли Gitea
DO $$
BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'gitea') THEN
    CREATE ROLE gitea LOGIN PASSWORD 'gitea';
  END IF;
END
$$;

-- 🛠 Создание базы Gitea
\connect postgres
SELECT 'CREATE DATABASE gitea OWNER gitea'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'gitea')
\gexec

-- 🔐 Создание роли Mattermost
DO $$
BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'mmuser') THEN
    CREATE ROLE mmuser LOGIN PASSWORD 'mmuser_password';
  END IF;
END
$$;

-- 🛠 Создание базы Mattermost
SELECT 'CREATE DATABASE mattermost OWNER mmuser'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'mattermost')
\gexec

