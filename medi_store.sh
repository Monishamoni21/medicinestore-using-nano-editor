FILE="medicines.txt"

add_medicine() {
    echo "Enter Medicine ID:"
    read id
    echo "Enter Medicine Name:"
    read name
    echo "Enter Medicine Price:"
    read price
    echo "Enter Medicine Quantity:"
    read quantity
    echo "$id,$name,$price,$quantity" >> $FILE
    echo "Medicine added successfully!"
}

view_medicines() {
    if [ -s $FILE ]; then
        echo "ID, Name, Price, Quantity"
        cat $FILE
    else
        echo "No medicines available."
    fi
}

update_medicine() {
    echo "Enter Medicine ID to update:"
    read id
    if grep -q "$id" $FILE; then
        echo "Enter new Medicine Name:"
        read name
        echo "Enter new Medicine Price:"
        read price
        echo "Enter new Medicine Quantity:"
        read quantity
        sed -i "/^$id,/c\\$id,$name,$price,$quantity" $FILE
        echo "Medicine updated successfully!"
    else
        echo "Medicine ID not found."
    fi
}

delete_medicine() {
    echo "Enter Medicine ID to delete:"
    read id
    if grep -q "$id" $FILE; then
        sed -i "/^$id,/d" $FILE
        echo "Medicine deleted successfully!"
    else
        echo "Medicine ID not found."
    fi
}

while true; do
    echo "Medicine Store Management"
    echo "1. Add Medicine"
    echo "2. View Medicines"
    echo "3. Update Medicine"
    echo "4. Delete Medicine"
    echo "5. Exit"
    echo "Choose an option:"
    read option

    case $option in
        1) add_medicine ;;
        2) view_medicines ;;
        3) update_medicine ;;
        4) delete_medicine ;;
        5) exit ;;
        *) echo "Invalid option. Try again." ;;
    esac
done