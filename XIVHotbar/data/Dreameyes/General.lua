
xivhotbar_keybinds_general['Root'] = {
    -- #1 Hotbar
	{'f 1 1', 'item', 'Remedy', 'me', 'Remedy', 'remedy'},
	{'f 1 2', 'item', 'Echo Drops', 'me', 'Echo D.', 'Echo_Drops'},
	{'f 1 3', 'item', 'Holy Water', 'me', 'H. Water', 'Holy_Water'},
	
	{'f 1 6', 'ct', '/input //jc war/drg', '', 'WAR', 'war'},
	{'f 1 7', 'ct', '/input //jc drk/sam', '', 'DRK', 'drk'},
	{'f 1 8', 'ct', '/input //jc cor/nin', '', 'COR', 'cor'},
	{'f 1 9', 'ct', '/input //jc sam/drg', '', 'SAM', 'sam'},
	{'f 1 10', 'ct', '/input //jc blu/drg', '', 'BLU', 'blu'},

    -- #2 Hotbar
	{'f 2 1', 'ct', '/input //tru 1', "", 'Tank', 'trusts/trust-valaineral'},
	{'f 2 2', 'ct', '/input //tru 2', '', 'Support', 'trusts/trust-koru-moru'},
	
	{'f 2 3', 'ct', '/input //trust follow me', '', 'Follow', 'trusts/follow'},
	{'f 2 4', 'ct', '/input //trust follow stopall', '', 'Stay', 'trusts/stop'},
	{'f 2 5', 'ct', '/input //send @all //trust cycle AutoEngageMode', '', 'Engage', 'trusts/engage'},
	{'f 2 6', 'ct', '/input //send @all //trust cycle AutoSkillchainMode', '', 'Skillchain', 'trusts/skillchain'},
	{'f 2 7', 'ct', '/input //trust sendall trust stop', '', 'Stop', 'trusts/truststop'},
	{'f 2 8', 'ct', '/input //trust sendall trust start', '', 'Start', 'trusts/truststart'},
	{'f 2 9', 'ct', '/input //trust assist me', '', 'Assist', 'trusts/assist'},
	{'f 2 10', 'ct', '/input //send @all //lua l trust', '', 'Load Trust', 'trusts/load1'},
		
	-- #3 Hotbar	
		
}


return xivhotbar_keybinds_general