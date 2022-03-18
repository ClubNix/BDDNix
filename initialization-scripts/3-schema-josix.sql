CREATE TABLE IF NOT EXISTS josix.User (
    idUser BIGINT,
    joinVoc TIMESTAMP,
    PRIMARY KEY(idUser)
);

CREATE TABLE IF NOT EXISTS josix.Guild (
    idGuild BIGINT,
    totalMember SMALLINT DEFAULT 0,
    sendStatus CHAR(1) DEFAULT '0',
    lastSend TIMESTAMP DEFAULT NOW(),
    chanStat BIGINT NOT NULL,
    PRIMARY KEY(idGuild)
);

CREATE TABLE IF NOT EXISTS josix.Channel (
    idChannel BIGINT,
    idGuild BIGINT NOT NULL,
    nbMsg BIGINT DEFAULT 0,
    PRIMARY KEY(idChannel),
    CONSTRAINT fk_guild_channel FOREIGN KEY(idGuild) REFERENCES josix.Guild(idGuild)
);

CREATE TABLE IF NOT EXISTS josix.MsgReact (
    idMsg BIGINT NOT NULL,
    idReact BIGINT NOT NULL,
    idRole BIGINT NOT NULL,
    idGuild BIGINT NOT NULL,
    CONSTRAINT fk_guild_msgR_id FOREIGN KEY(idGuild) REFERENCES josix.Guild(idGuild)
);

--
--
--

CREATE TABLE IF NOT EXISTS josix.UserGuild (
    idUser BIGINT NOT NULL,
    idGuild BIGINT NOT NULL,
    nbMsg BIGINT DEFAULT 0,
    nbSecondVC INT DEFAULT 0,
    CONSTRAINT fk_user_ug_id FOREIGN KEY(idUser) REFERENCES josix.User(idUser),
    CONSTRAINT fk_guild_ug_id FOREIGN KEY(idGuild) REFERENCES josix.Guild(idGuild)
);

CREATE TABLE IF NOT EXISTS josix.UserChannel (
    idUser BIGINT NOT NULL,
    idChannel BIGINT NOT NULL,
    nbMsg INT DEFAULT 0,
    CONSTRAINT fk_user_uc_id FOREIGN KEY(idUser) REFERENCES josix.User(idUser),
    CONSTRAINT fk_channel_uc_id FOREIGN KEY(idChannel) REFERENCES josix.Channel(idChannel)
);