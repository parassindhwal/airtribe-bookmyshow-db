CREATE TABLE Theatre (
    TheatreID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

-- Sample entries
INSERT INTO Theatre (Name, Location) VALUES 
('Cineplex', 'Downtown'),
('Movieland', 'Uptown');

CREATE TABLE Movie (
    MovieID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    Duration INT -- Duration in minutes
);

-- Sample entries
INSERT INTO Movie (Title, Genre, Duration) VALUES 
('Inception', 'Sci-Fi', 148),
('The Dark Knight', 'Action', 152);

CREATE TABLE Shows (
    ShowID INT PRIMARY KEY AUTO_INCREMENT,
    TheatreID INT,
    MovieID INT,
    ShowDate DATE,
    ShowTime TIME,
    FOREIGN KEY (TheatreID) REFERENCES Theatre(TheatreID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

-- Sample entries
INSERT INTO Shows (TheatreID, MovieID, ShowDate, ShowTime) VALUES 
(1, 1, '2024-06-17', '18:00:00'),
(1, 2, '2024-06-17', '21:00:00'),
(2, 1, '2024-06-17', '19:00:00');

SELECT 
    s.ShowID,
    m.Title AS MovieTitle,
    s.ShowTime
FROM 
    Shows s
JOIN 
    Movie m ON s.MovieID = m.MovieID
JOIN 
    Theatre t ON s.TheatreID = t.TheatreID
WHERE 
    s.ShowDate = '2024-06-17'
    AND t.Name = 'Movieland';