CREATE DATABASE IF NOT EXISTS praha_slack DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS praha_slack.users(
  user_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  user_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS praha_slack.workspaces(
  workspace_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  workspace_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS praha_slack.workspace_belong_users(
  workspace_id INT NOT NULL,
  user_id INT NOT NULL,
  INDEX worksp_ind (workspace_id),
  FOREIGN KEY (workspace_id) 
    REFERENCES workspaces(workspace_id)
    ON DELETE CASCADE,
  INDEX user_ind (user_id),
  FOREIGN KEY (user_id) 
    REFERENCES users(user_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS praha_slack.channels(
  channel_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  workspace_id INT NOT NULL,
  channel_name VARCHAR(50) NOT NULL,
  INDEX worksp_ind (workspace_id),
  FOREIGN KEY (workspace_id) 
    REFERENCES workspaces(workspace_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS praha_slack.channel_belong_users(
  channel_id INT NOT NULL,
  user_id INT NOT NULL,
  INDEX ch_ind (channel_id),
  FOREIGN KEY (channel_id) 
    REFERENCES channels(channel_id)
    ON DELETE CASCADE,
  INDEX user_ind (user_id),
  FOREIGN KEY (user_id) 
    REFERENCES users(user_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS praha_slack.messages(
  message_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  user_id INT NOT NULL,
  channel_id INT NOT NULL,
  content Text NOT NULL,
  is_send BOOLEAN NOT NULL,
  send_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX user_ind (user_id),
  FOREIGN KEY (user_id) 
    REFERENCES users(user_id)
    ON DELETE CASCADE,
  INDEX ch_ind (channel_id),
  FOREIGN KEY (channel_id) 
    REFERENCES channels(channel_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS praha_slack.thread_messages(
  owner_msg_id INT NOT NULL,
  belong_msg_id INT NOT NULL,
  INDEX own_msg_ind (owner_msg_id),
  FOREIGN KEY (owner_msg_id) 
    REFERENCES messages(message_id)
    ON DELETE CASCADE,
  INDEX belo_msg_ind (belong_msg_id),
  FOREIGN KEY (belong_msg_id) 
    REFERENCES messages(message_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS praha_slack.reactions(
  reaction_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  user_id INT NOT NULL,
  message_id INT NOT NULL,
  stamp_type VARCHAR(50) NOT NULL,
  INDEX user_ind (user_id),
  FOREIGN KEY (user_id) 
    REFERENCES users(user_id)
    ON DELETE CASCADE,
  INDEX msg_ind (message_id),
  FOREIGN KEY (message_id) 
    REFERENCES messages(message_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS praha_slack.mentions(
  mention_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  message_id INT NOT NULL,
  INDEX msg_ind (message_id),
  FOREIGN KEY (message_id) 
    REFERENCES messages(message_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS praha_slack.mention_send_users(
  mention_id INT NOT NULL,
  user_id INT NOT NULL,
  INDEX user_ind (user_id),
  FOREIGN KEY (user_id) 
    REFERENCES users(user_id)
    ON DELETE CASCADE
);
