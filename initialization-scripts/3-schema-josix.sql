DROP TABLE IF EXISTS josix.MsgCouple;
DROP TABLE IF EXISTS josix.UserChannel;
DROP TABLE IF EXISTS josix.UserGuild;
DROP TABLE IF EXISTS josix.Channel;
DROP TABLE IF EXISTS josix.MsgReact;
DROP TABLE IF EXISTS josix.ReactCouple;
DROP TABLE IF EXISTS josix.Guild;
DROP TABLE IF EXISTS josix.User;

--  

CREATE TABLE IF NOT EXISTS josix.User (
    idUser BIGINT,
    elo INT DEFAULT 1000,
    nbGames INT DEFAULT 0,
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

CREATE TABLE IF NOT EXISTS josix.DartLog (
    idLog SERIAL,
    idGuild BIGINT NOT NULL,
    winnerName VARCHAR(64),
    losersName VARCHAR(64) ARRAY,
    PRIMARY KEY(idLog),
    CONSTRAINT fk_guild_log_id FOREIGN KEY(idGuild) REFERENCES josix.Guild(idGuild)
);

CREATE TABLE IF NOT EXISTS josix.MsgReact (
    idMsg BIGINT NOT NULL,
    idGuild BIGINT NOT NULL,
    PRIMARY KEY(idMsg),
    CONSTRAINT fk_guild_msgR_id FOREIGN KEY(idGuild) REFERENCES josix.Guild(idGuild)
);

CREATE TABLE IF NOT EXISTS josix.ReactCouple (
    idCouple SERIAL,
    nomEmoji VARCHAR(63) NOT NULL,
    idRole BIGINT NOT NULL,
    PRIMARY KEY(idCouple)
);

--
--  
--

CREATE TABLE IF NOT EXISTS josix.UserGuild (
    idUser BIGINT NOT NULL,
    idGuild BIGINT NOT NULL,
    nbMsg BIGINT DEFAULT 0,
    nbSecondVC INT DEFAULT 0,
    PRIMARY KEY(idUser, idGuild),
    CONSTRAINT fk_user_ug_id FOREIGN KEY(idUser) REFERENCES josix.User(idUser),
    CONSTRAINT fk_guild_ug_id FOREIGN KEY(idGuild) REFERENCES josix.Guild(idGuild)
);

CREATE TABLE IF NOT EXISTS josix.UserChannel (
    idUser BIGINT NOT NULL,
    idChannel BIGINT NOT NULL,
    nbMsg INT DEFAULT 0,
    PRIMARY KEY(idUser, idChannel),
    CONSTRAINT fk_user_uc_id FOREIGN KEY(idUser) REFERENCES josix.User(idUser),
    CONSTRAINT fk_channel_uc_id FOREIGN KEY(idChannel) REFERENCES josix.Channel(idChannel)
);

CREATE TABLE IF NOT EXISTS josix.MsgCouple (
    idMsg BIGINT NOT NULL,
    idCouple BIGINT NOT NULL,
    PRIMARY KEY(idMsg, idCouple),
    CONSTRAINT fk_msg_mc_id FOREIGN KEY(idMsg) REFERENCES josix.MsgReact(idMsg),
    CONSTRAINT fk_couple_mc_id FOREIGN KEY(idCouple) REFERENCES josix.ReactCouple(idCouple)
);
