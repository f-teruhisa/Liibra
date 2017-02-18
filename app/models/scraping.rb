require "sparql/client"

client = SPARQL::Client.new("http://ja.dbpedia.org/sparql")
results = client.query("select distinct ?name ?abstract where {
    ?company <http://dbpedia.org/ontology/wikiPageWikiLink> <http://ja.dbpedia.org/resource/Category:東証一部上場企業> .
    ?company rdfs:label ?name .
    ?company <http://dbpedia.org/ontology/abstract> ?abstract .}")

results.each do |solution|
  puts "#{solution[:resource]} | #{solution[:title]}"
end