Apres avoir cloné ce dossier, ne pas oublier d'extraire tous les fichiers vers son home directory.

Pour demarrer l'emulateur de terminal tmux, entrez "tmux" dans votre terminal
!!! Une fois terminé avec votre session, effectuer la commande "tmux kill-server" afin d'eviter tout comportement innatendu


.gitignore_global:
->ce fichier sert a eviter de push tout fichier idesirable vers son git repo.
----> une fois ce fichier cloné, rentrer la commande suivante dans le terminal afin de l'activer:
	git config --global core.excludesfile ~/.gitignore_global
		Permet de set up ce fichier sur l'ensemble du system.
->vous pouvez ajouter ou retirer des regles a ce fichier a tout moment en y accedant (vim ~/.gitignore_global)



.tmux.conf:
->ce fichier consiste a gerer les mappings et fonctionnement de tmux.
	-ctrl + s: ouvrir un terminal en dessous
	-ctrl + n: ouvrir un terminal a droite
	-ctrl + h: changer le focus vers terminal a gauche
	-ctrl + j: changer le focus vers terminal en dessous
	-ctrl + k: changer le focus vers terminal au dessus
	-ctrl + l: changer le focus vers le terminal a droite
	-ctrl + space: sauter entre les 2 derniers terminaux utilisés
	-ctrl + e: egualiser tous les terminaux ouverts
		!!! redimensionne egalement les terminaux horizontaux en verticaux
	ctrl + q: quite le terminal actuel

	-alt + h: redimensionner le terminal vers la droite
	-alt + j: redimensionner le terminal vers le bas
	-alt + k: redimensionner le terminal vers le haut
	-alt + l: redimensionner le terminal vers la droite

!!! Si vous voulez modifier ce fichier(.tmux.conf), ne pas oublier de lancer la commande "tmux source-file ~/.tmux.conf"
	apres sauvegarde des modifications afin de mettre a jour l'emulateur tmux



.vimrc:
->ce fichier contient tous les plugins necessaires pour les raccourcis clavier. Avant de proceder a la mise en place, veillez installer vim-plug sur votre pc en utilisant cette commande:
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
Une fois cette etape faite, vous pouvez proceder a la mise en place des plugins contenus dans ce fichier en tapant la command ":PlugInstall" apres avoir ouvert via vim votre fichier ~/.vimrc: (vim ~/.vimrc) ---> :PlugInstall

raccourcis:
	-Tab + h: redimensionner la fenetre vim vers la droite
	-Tab + j: redimensionner la fenetre vim vers le haut
	-Tab + k: redimensionner la fenetre vim vers le bas
	-Tab + l: redimensionner la fenetre vim vers la droite

	-Tab + n: ouvrir nerdtree (l'arbre des fichiers)
	-Tab + v: visual block

	-Ctrl + n: ouvrir une fenetre vim a droite
	-Ctrl + s: ouvrir une fenetre vim a gauche
	-Ctrl + q: quite la fenetre vim actuellement ouverte

	-Espace + d: aller a la definition de fonction indiquée par le curseur
	-Espace + b: revenir de la definition de fonction (utilisable uniquement si Espace + d a été utilisé avant)

---> la navigation entre les fenetres utilise les memes touches que la configuration tmux



c.vim:
->ce fichier vient d'un des plugins que vous aurez au prealable installé. Il est la dans le but de faciliter la lecture du code en language C via une surbrillance de differentes types de syntax, libre a vous de l'utiliser ou pas.
-Si vous voulez vous en servir, il faudra le remplacer par le fichier c.vim installé de base. Pour ce faire, il faudra:
	1)acceder au dossier le contenant qui se trouve (normalement) a cet emplacement: "~/.vim/plugged/c.vim".
	2) supprimer le fichier "c.vim" actuellement en place a cet empalcement
	2) bouger le c.vim contenu dans ce dossier a l'emplacement cité precedement.
-Si vous ne voulez pas vous en servir, vous pouvez tout simplement le supprimer


