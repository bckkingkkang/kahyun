   CREATE TABLE kahyun.board
   (seq int(10) NOT NULL AUTO_INCREMENT comment 'PK',
   title varchar(50) NOT NULL comment '제목',
   content varchar(100) NOT NULL comment '내용',
   nickname varchar(50) NOT NULL,
   create_dt datetime NOT NULL comment '등록일',
   update_dt datetime NULL comment '수정일',
   status enum('N','D') NOT NULL DEFAULT 'N' comment '상태',
   `view` int(10) NOT NULL DEFAULT 0 comment '조회 수',
  
   PRIMARY KEY (seq)
   ) ENGINE=INNODB DEFAULT charset=utf8
   
   
   INSERT INTO kahyun.board 
   (title, nickname, create_dt)
   values("제목2", "nickname2", current_time())
