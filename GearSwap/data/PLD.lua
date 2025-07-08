-----------------------MACRO BOOK------------------

send_command('input /macro book 3')
send_command('input /macro set 10')

-----------------------BINDING------------------


-----------------------BINDING------------------

--TRUST--

send_command('bind !numpad0 input /returntrust <st>')
send_command('bind !numpad. input /ma "August" <me>; input /recast "August"')
send_command('bind !numpad1 input /ma "Apururu (UC)" <me>; input /recast "Apururu (UC)"')
send_command('bind !numpad2 input /ma "Kupipi" <me>; input /recast "Kupipi"')
send_command('bind !numpad3 input /ma "Amchuchu" <me>; input /recast "Amchuchu"')
send_command('bind !numpad4 input /ma "Joachim" <me>; input /recast "Joachim"')
send_command('bind !numpad5 input /ma "Qultada" <me>; input /recast "Qultada"')
send_command('bind !numpad6 input /ma "Ulmia" <me>; input /recast "Ulmia"')
send_command('bind !numpad7 input /ma "Shantotto II" <me>; input /recast "Shantotto II"')
send_command('bind !numpad9 input /ma "Selh\'teus" <me>; input /recast "Selh\'teus"')


--OTHER--

send_command('bind ^numpad. input /jobemote RUN; wait 1.3; input /jobemote MNK; wait 1.3; input /jobemote BLM; wait 1.3; input /jobemote DRG')
send_command('bind ^F9 input /equip L.ring "Echad Ring"; input /echo EXP Ring equiped.; wait 7; input /item "Echad Ring" <me>')
send_command('bind ^F10 input /equip L.ring "Trizek Ring"; input /echo CP Ring equiped.; wait 7; input /item "Trizek Ring" <me>')
send_command('bind ^F12 input //mh')

send_command('bind !numpad/ input /item "Grape Daifuku" <me>')
send_command('bind !numpad* input /item "Remedy" <me>')


-----------------------WEAPON SKILLS & JA----------

send_command('unbind numpad1')
send_command('bind @numpad1 input /ws "Savage Blade" <t>')
send_command('bind @numpad2 input /ws "Chant du Cygne" <t>')
send_command('bind @numpad3 input /ws "Sanguine Blade" <t>')

send_command('bind @numpad4 input /ja "Sentinel" <me>; input /recast "Sentinel"')
send_command('bind @numpad5 input /ja "Palisade" <me>; input /recast "Palisade"')
send_command('bind @numpad6 input /ja "Defender" <me>; input /recast "Defender"')
send_command('bind @numpad7 input /ja "Fealty" <me>; input /recast "Fealty"')
send_command('bind @numpad8 input /ja "Rampart" <me>; input /recast "Rampart"')
send_command('bind @numpad9 input /ja "Chivalry" <me>; input /recast "Chivalry"')
send_command('bind @numpad* input /recast "Cover"; input /ja "Cover" <st>')





function precast(spell)

	if spell.english == 'Savage Blade' then
			send_command('input /equipset 46 echo')
			send_command('input /echo -- Savage Blade Set equipped --')	
			
	elseif spell.english == 'Chant du Cygne' then
			send_command('input /equipset 45 echo')
			send_command('input /echo -- CdC Set equipped --')	
		
	elseif spell.english == 'Reprisal' or spell.english == 'Phalanx' or spell.english == 'Crusade' or spell.english == 'Enlight' then
			send_command('input /equipset 48')
			
	elseif spell.english:startswith ('Cure') then
			send_command('input /equipset 47')
	
	end
	
end


function midcast(spell)

	if spell.english == 'Reprisal' or spell.english == 'Phalanx' or spell.english == 'Crusade' or spell.english == 'Enlight' then
			send_command('wait 2; input /equipset 41; input /echo -- Default Set equipped --')
	
	end
	
end


function aftercast(spell)

	if spell.english == 'Savage Blade' or spell.english == 'Chant du Cygne'  then
            send_command('wait 1; input /equipset 41 echo; input /echo -- Default Set equipped --')
	
	elseif spell.english:startswith('Cure') then
            send_command('wait 1; input /equipset 41 echo; input /echo -- Default Set equipped --')
	
	end
end
