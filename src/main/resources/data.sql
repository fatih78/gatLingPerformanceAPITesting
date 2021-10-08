--Generate some record, don't needed to specify the Id's because that's generated automatically!
INSERT INTO drink (name, sort, abv, id, origin, email) VALUES ('Raki', 'alcoholic', 20.0, 1, 'Turkey', 'test@gmail.com');
INSERT INTO drink (name, sort, abv, id,  origin, email) VALUES ('Cola', 'non-alcoholic', 0.0, 2, 'America', 'test@gmail.com');
INSERT INTO drink (name, sort, abv, id, origin, email) VALUES ('Gazoz', 'non-alcoholic', 0.0, 3, 'Turkey', 'test@gmail.com');

COMMIT;