use strict;
use Test::More tests => 9;

###########################################################

    use WWW::Scraper::ISBN;
    
    my $scraper = WWW::Scraper::ISBN->new();
    isa_ok($scraper, 'WWW::Scraper::ISBN');
    $scraper->drivers('Siciliano');
    my $isbn = '8532609880';
    my $result = $scraper->search($isbn);
    
    SKIP: {
        skip($result->error . "\n",8) unless $result->found;
        
        is($result->found,1);
        is($result->found_in,'Siciliano');
        
        my $book = $result->book;
        like($book->{'title'},qr/DESEJO AO DESEJO/);
        is($book->{'author'},     'Leda M. C. Barone');
        is($book->{'book_link'},  'http://www.siciliano.com.br/livro.asp?orn=LSE&Tipo=2&ID=180');
        is($book->{'image_link'}, 'http://www.siciliano.com.br/capas/8532609880.gif');
        is($book->{'pubdate'},    '1993');
        is($book->{'publisher'},  'VOZES');
    }
    
###########################################################
