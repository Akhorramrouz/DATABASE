CREATE TABLE mediaPrice(
    Media VARCHAR(10) PRIMARY KEY,
    MediaPrice DECIMAL(5,2)
);

CREATE TABLE musicMedia(
    Title VARCHAR(20) PRIMARY KEY,
    Media VARCHAR(10),
    CONSTRAINT media_mediaPrice_fk FOREIGN KEY (Media)
     REFERENCES mediaPrice(Media)
);


CREATE TABLE NumberGroupMembers(
    Artist VARCHAR(30) PRIMARY KEY,
    NumGrpMembers TINYINT UNSIGNED
);

CREATE TABLE Producers(
    Producer VARCHAR(30) PRIMARY KEY,
    ProducerURL VARCHAR(50)
);

CREATE TABLE Categories(
    Category VARCHAR(30) PRIMARY KEY,
    CategorySale DECIMAL(9,2)
);


CREATE TABLE  music(
    Title VARCHAR(20) NOT NULL,
    Artist Varchar(30),
    ReleaseYear Char(4),
    Producer VARCHAR(30),
    Category Varchar(30),

    CONSTRAINT title_pk PRIMARY KEY(Title),

    Constraint title_media_fk FOREIGN KEY (Title) 
    REFERENCES musicMedia(Title),

    CONSTRAINT Artist_NumGrpMembers_fk FOREIGN KEY (Artist)
    REFERENCES NumberGroupMembers(Artist),

    CONSTRAINT Producer_ProducerURL_fk FOREIGN KEY (Producer)
    REFERENCES Producers(Producer),

    CONSTRAINT Categories_categoriesSales_fk FOREIGN KEY(Category)
    REFERENCES Categories(Category)
);