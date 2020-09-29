--Generate some record, don't needed to specify the Id's because that's generated automatically!
INSERT INTO drink (name, sort, abv, id, origin) VALUES ('Raki', 'alcoholic', 20.0, 1, 'Turkey');
INSERT INTO drink (name, sort, abv, id,  origin) VALUES ('Cola', 'non-alcoholic', 0.0, 2, 'America');
INSERT INTO drink (name, sort, abv, id, origin) VALUES ('Gazoz', 'non-alcoholic', 0.0, 3, 'Turkey');

COMMIT;