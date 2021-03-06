use Modern::Perl;
use List::Util 'max', 'min', 'reduce';

my $filename = "example.txt";

open(my $fh, '<', $filename) or die "Could not open file: $filename";

getJumps($fh);


sub getJumps {
	my ($jumpsFile) = @_;
	my $numJumps;
	my $index = 0;
	my @jumpList;
	while (my $jumpsRow = <$jumpsFile>) {
		chomp $jumpsRow;
		push @jumpList, $jumpsRow;
	}

	# say join ' ', @jumpList;
	while (1) {
		my $prevIndex = $index;

		# say join ' ', @jumpList;
		# say "Index: $index";
		# say "jumplist at index $index: " . $jumpList[$index];

		$index += $jumpList[$index];
		$numJumps++;

		if ($index >= scalar(@jumpList)) {
			say "Number of jumps: $numJumps";
			exit 1;
		}

		$jumpList[$prevIndex] = $jumpList[$prevIndex] + 1;
	}
}