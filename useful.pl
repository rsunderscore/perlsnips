sub print_hash {
	#print "printing hash...\n";
	#given a hash print out the contents (even if they are hashes)
	my %thehash = %{$_[0]};
	my $indent = $_[1];
	#print "\n";
	foreach my $key (keys %thehash)
	{
		print "$indent$key->";
		if($thehash{$key}=~/HASH/){ 
			print "\n";
			my $priorindent = $indent;
			print_hash($thehash{$key} , $indent.="\t" );
			$indent = $priorindent;
		}elsif($thehash{$key}=~/ARRAY/){ 
			my $priorindent = $indent;
			print_array($thehash{$key}, $indent.="\t");
			$indent = $priorindent;
		}
		else { print $thehash{$key},"\n"; }
	}
	print "\n";
}

sub print_array {
	my @thearray = @{$_[0]};
	my $indent = $_[1];
	print "\n";
	for(my $i=0;$i<scalar(@thearray);$i++)#each my $item (@thearray)
	{
		my $item = $thearray[$i];
		print $indent, "[$i]";
		if($item=~/ARRAY/)
		{
			my $priorindent = $indent;
			print_array($item, $indent.="\t");
			$indent = $priorindent;

		}elsif($item=~/HASH/)
		{
			my $priorindent = $indent;
			print_hash($item, $indent.="\t");
			$indent = $priorindent;
		}else { print $item,"\n";}
	}
	print $indent."\n";
}
