#!/bin/bash
#

if [ ! -f $HOME/.changed ]; then
    echo ""
    echo "!!!!!!!"
    echo "Initial password is 123; please change it."
    echo "!!!!!!!"

    # Prompt the user
    read -p "Do you want to change your password? (Y/n) " answer
    answer=${answer:-Y}

    # Process the user's response
    case "$answer" in
        [Nn]* )
            echo "No password change requested."
            ;;
        [Yy]* )
            echo "Changing password for user $USER."
            sudo passwd imafish && touch .changed
            ;;
        * )
            echo "Please answer Y for yes or N for no."
            ;;
    esac
fi

echo ""
