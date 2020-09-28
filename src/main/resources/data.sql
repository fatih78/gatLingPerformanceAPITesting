--Generate some record, don't needed to specify the Id's because that's generated automatically!
INSERT INTO drink (name, sort, abv, origin) VALUES ('Raki', 'alcoholic', 20.0, 'Turkey');
INSERT INTO drink (name, sort, abv, origin) VALUES ('Cola', 'non-alcoholic', 0.0, 'America');
INSERT INTO drink (name, sort, abv, origin) VALUES ('Gazoz', 'non-alcoholic', 0.0, 'Turkey');

COMMIT;