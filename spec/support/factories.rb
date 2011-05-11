Factory.define :film do |film|

#factory is an object that comes with the factorygirl gem

film.name 'test film name'
film.url 'www.testes.com'
film.description 'seedy testing film'
film.rating 3
film.genre Genre.new(:name => 'Default')



end