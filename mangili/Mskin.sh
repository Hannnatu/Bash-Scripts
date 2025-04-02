#!/bin/bash

# Function to pick two random products for each routine without repeating options
pick_products() {
    local products=("$@")
    local count=${#products[@]}
    local rand1=$((RANDOM % count))
    local rand2=$((RANDOM % count))

    # Ensure products are not repeated
    while [ $rand2 -eq $rand1 ]; do
        rand2=$((RANDOM % count)) 
    done

    echo "${products[$rand1]}, ${products[$rand2]}"
}

# Welcome message
echo "What's your name?"
read user_name
echo "Welcome to Mangili! $user_name 😊"

# Ask if the user knows their skin type
echo "Do you know your skin type $user_name? (yes/no)"
read knows_skin_type

if [[ "$knows_skin_type" == "no" ]]; then
    echo "No worries! Take this quick 5-7 minute skin type test and come back:"
    echo "https://www.instagram.com/haninfluence?igsh=Yjdnemo5NHQ1dm1j&utm_source=qr"
    exit 0
fi

# Ask for skin type
echo "What is your skin type? (Dry, Oily, Sensitive, Combination, Acne-prone, Mature, Normal)"
read skin_type

# Define product options for different skin types

# Dry Skin Routine
dry_cleansers=("Heimish All Clean Balm" "Dr Althea Pure Grinding")
dry_toners=("Jumiso Hyaluronnic Acid Toner" "Medicube AGE-R Gluthatione Toner")
dry_essences=("Missha Time Revolution The First Treatment Essence" "Pyunkang Yul Essence Toner")
dry_serums=("COSRX Advanced Snail 96 Mucin Power Essence" "Iunik Propolis Vitamin Synergy Serum")
dry_moisturizers=("CeraVe Moisturizing Cream" "Etude House SoonJung 2x Barrier Intensive Cream")
dry_sunscreens=("Isntree Hyaluronic Acid Watery Sun Gel" "Neogen Day-Light Protection Sun Screen")

# Sensitive Skin Routine
sensitive_cleansers=("Heimish All Clean Balm" "Iunik Calendula Complete Cleansing Balm")
sensitive_cleansing_oils=("Garnier SkinActive Micellar Cleansing Water" "Klairs Gentle Black Deep Cleansing Oil")
sensitive_toners=("Pyunkang Yul Essence Toner" "Klairs Supple Preparation Unscented Toner")
sensitive_essences=("Pyunkang Yul Essence Toner" "Missha Time Revolution The First Treatment Essence")
sensitive_serums=("COSRX Advanced Snail 96 Mucin Power Essence" "Dr. Althea Azulene 147HA Intensive Soothing Cream")
sensitive_moisturizers=("Dr. Jart+ Cicapair Tiger Grass Re.Pair Serum" "Etude House SoonJung 2x Barrier Intensive Cream")
sensitive_sunscreens=("Neogen Day-Light Protection Sun Screen" "Isntree Hyaluronic Acid Watery Sun Gel")

# Combination Skin Routine
combination_cleansers=("Heimish All Clean Balm" "COSRX Low pH Good Morning Gel Cleanser")
combination_toners=("MediCube Zero Pore Pads" "Isntree Green Tea Fresh Toner")
combination_essences=("Mixsoon Bean Essence" "Jumiso Snail Mucin Essence")
combination_serums=("Beauty of Joseon Glow Serum" "Miguhara Ultra Whitening Serum")
combination_moisturizers=("Purito Deep Sea Water Cream" "Benton Aloe Propolis Soothing Gel")
combination_sunscreens=("Round Lab Birch Juice Sun Cream" "Skin1004 Madagascar Centella Air-Fit Suncream")

# Acne-Prone Skin Routine
acne_prone_cleansers=("Heimish All Clean Balm" "COSRX Low pH Good Morning Gel Cleanser")
acne_prone_toners=("Isntree Green Tea Fresh Toner" "COSRX AHA/BHA Clarifying Treatment Toner")
acne_prone_essences=("Jumiso Snail Mucin Essence" "Skinfood Royal Honey Propolis Essence")
acne_prone_serums=("COSRX BHA Blackhead Power Liquid" "A’pieu Madecassoside Serum")
acne_prone_moisturizers=("Benton Aloe Propolis Soothing Gel" "COSRX Oil-Free Ultra-Moisturizing Lotion")
acne_prone_sunscreens=("Isntree Hyaluronic Acid Watery Sun Gel" "Neogen Day-Light Protection Sun Screen")

# Mature / Aging Skin Routine
mature_cleansers=("Heimish All Clean Balm" "Iunik Calendula Complete Cleansing Balm")
mature_toners=("Isntree Green Tea Fresh Toner" "Anua Heartleaf 77% Soothing Toner")
mature_essences=("Jumiso Snail Mucin Essence" "Beauty of Joseon Glow Serum")
mature_serums=("Miguhara Ultra Whitening Serum" "MediCube Age-R Serum")
mature_moisturizers=("Dr. Althea Azulene 147HA Intensive Soothing Cream" "Purito Deep Sea Water Cream")
mature_sunscreens=("Isntree Hyaluronic Acid Watery Sun Gel" "COSRX Aloe Soothing Sun Cream")

# Normal Skin Routine
normal_cleansers=("Iunik Calendula Complete Cleansing Balm" "COSRX Low pH Good Morning Gel Cleanser")
normal_toners=("Klairs Supple Preparation Unscented Toner" "Isntree Green Tea Fresh Toner")
normal_essences=("Missha Time Revolution The First Treatment Essence" "Pyunkang Yul Essence Toner")
normal_serums=("Beauty of Joseon Glow Serum" "Miguhara Ultra Whitening Serum")
normal_moisturizers=("CeraVe Moisturizing Cream" "Benton Aloe Propolis Soothing Gel")
normal_sunscreens=("Isntree Hyaluronic Acid Watery Sun Gel" "Neogen Day-Light Protection Sun Screen")

# Oily Skin Routine
oily_cleansers=("Heimish All Clean Balm" "Beauty of Joseon Radiance Cleansing Balm")
oily_toners=("Anua Heartleaf 77% Soothing Toner" "Isntree Green Tea Fresh Toner")
oily_essences=("Mixsoon Bean Essence" "Pyunkang Yul Essence Toner")
oily_serums=("Beauty of Joseon Glow Serum" "Miguhara Ultra Whitening Serum")
oily_moisturizers=("Purito Deep Sea Water Cream" "Benton Aloe Propolis Soothing Gel")
oily_sunscreens=("Isntree Hyaluronic Acid Watery Sun Gel" "Skin1004 Madagascar Centella Air-Fit Suncream")

# Routine Output Based on Skin Type
echo "🌞 Day Routine for $skin_type Skin:"
case "$skin_type" in
    "dry")
        echo "Cleanser: $(pick_products "${dry_cleansers[@]}")"
        echo "Toner: $(pick_products "${dry_toners[@]}")"
        echo "Essence: $(pick_products "${dry_essences[@]}")"
        echo "Serum: $(pick_products "${dry_serums[@]}")"
        echo "Moisturizer: $(pick_products "${dry_moisturizers[@]}")"
        echo "Sunscreen: $(pick_products "${dry_sunscreens[@]}")"
        ;;
    "sensitive")
        echo "Cleanser: $(pick_products "${sensitive_cleansers[@]}")"
        echo "Cleansing Oil: $(pick_products "${sensitive_cleansing_oils[@]}")"
        echo "Toner: $(pick_products "${sensitive_toners[@]}")"
        echo "Essence: $(pick_products "${sensitive_essences[@]}")"
        echo "Serum: $(pick_products "${sensitive_serums[@]}")"
        echo "Moisturizer: $(pick_products "${sensitive_moisturizers[@]}")"
        echo "Sunscreen: $(pick_products "${sensitive_sunscreens[@]}")"
        ;;
    "combination")
        echo "Cleanser: $(pick_products "${combination_cleansers[@]}")"
        echo "Toner: $(pick_products "${combination_toners[@]}")"
        echo "Essence: $(pick_products "${combination_essences[@]}")"
        echo "Serum: $(pick_products "${combination_serums[@]}")"
        echo "Moisturizer: $(pick_products "${combination_moisturizers[@]}")"
        echo "Sunscreen: $(pick_products "${combination_sunscreens[@]}")"
        ;;
    "acne-prone")
        echo "Cleanser: $(pick_products "${acne_prone_cleansers[@]}")"
        echo "Toner: $(pick_products "${acne_prone_toners[@]}")"
        echo "Essence: $(pick_products "${acne_prone_essences[@]}")"
        echo "Serum: $(pick_products "${acne_prone_serums[@]}")"
        echo "Moisturizer: $(pick_products "${acne_prone_moisturizers[@]}")"
        echo "Sunscreen: $(pick_products "${acne_prone_sunscreens[@]}")"
        ;;
    "mature")
        echo "Cleanser: $(pick_products "${mature_cleansers[@]}")"
        echo "Toner: $(pick_products "${mature_toners[@]}")"
        echo "Essence: $(pick_products "${mature_essences[@]}")"
        echo "Serum: $(pick_products "${mature_serums[@]}")"
        echo "Moisturizer: $(pick_products "${mature_moisturizers[@]}")"
        echo "Sunscreen: $(pick_products "${mature_sunscreens[@]}")"
        ;;
    "normal")
        echo "Cleanser: $(pick_products "${normal_cleansers[@]}")"
        echo "Toner: $(pick_products "${normal_toners[@]}")"
        echo "Essence: $(pick_products "${normal_essences[@]}")"
        echo "Serum: $(pick_products "${normal_serums[@]}")"
        echo "Moisturizer: $(pick_products "${normal_moisturizers[@]}")"
        echo "Sunscreen: $(pick_products "${normal_sunscreens[@]}")"
        ;;
    "oily")
        echo "Cleanser: $(pick_products "${oily_cleansers[@]}")"
        echo "Toner: $(pick_products "${oily_toners[@]}")"
        echo "Essence: $(pick_products "${oily_essences[@]}")"
        echo "Serum: $(pick_products "${oily_serums[@]}")"
        echo "Moisturizer: $(pick_products "${oily_moisturizers[@]}")"
        echo "Sunscreen: $(pick_products "${oily_sunscreens[@]}")"
        ;;
    *)
        echo "Invalid skin type."
        ;;
esac

echo "🌙 Night Routine for $skin_type Skin:"
case "$skin_type" in
    "dry")
        echo "Cleanser: $(pick_products "${dry_cleansers[@]}")"
        echo "Toner: $(pick_products "${dry_toners[@]}")"
        echo "Essence: $(pick_products "${dry_essences[@]}")"
        echo "Serum: $(pick_products "${dry_serums[@]}")"
        echo "Moisturizer: $(pick_products "${dry_moisturizers[@]}")"
        ;;
    "sensitive")
        echo "Cleanser: $(pick_products "${sensitive_cleansers[@]}")"
        echo "Cleansing Oil: $(pick_products "${sensitive_cleansing_oils[@]}")"
        echo "Toner: $(pick_products "${sensitive_toners[@]}")"
        echo "Essence: $(pick_products "${sensitive_essences[@]}")"
        echo "Serum: $(pick_products "${sensitive_serums[@]}")"
        echo "Moisturizer: $(pick_products "${sensitive_moisturizers[@]}")"
        ;;
    "combination")
        echo "Cleanser: $(pick_products "${combination_cleansers[@]}")"
        echo "Toner: $(pick_products "${combination_toners[@]}")"
        echo "Essence: $(pick_products "${combination_essences[@]}")"
        echo "Serum: $(pick_products "${combination_serums[@]}")"
        echo "Moisturizer: $(pick_products "${combination_moisturizers[@]}")"
        ;;
    "acne-prone")
        echo "Cleanser: $(pick_products "${acne_prone_cleansers[@]}")"
        echo "Toner: $(pick_products "${acne_prone_toners[@]}")"
        echo "Essence: $(pick_products "${acne_prone_essences[@]}")"
        echo "Serum: $(pick_products "${acne_prone_serums[@]}")"
        echo "Moisturizer: $(pick_products "${acne_prone_moisturizers[@]}")"
        ;;
    "mature")
        echo "Cleanser: $(pick_products "${mature_cleansers[@]}")"
        echo "Toner: $(pick_products "${mature_toners[@]}")"
        echo "Essence: $(pick_products "${mature_essences[@]}")"
        echo "Serum: $(pick_products "${mature_serums[@]}")"
        echo "Moisturizer: $(pick_products "${mature_moisturizers[@]}")"
        ;;
    "normal")
        echo "Cleanser: $(pick_products "${normal_cleansers[@]}")"
        echo "Toner: $(pick_products "${normal_toners[@]}")"
        echo "Essence: $(pick_products "${normal_essences[@]}")"
        echo "Serum: $(pick_products "${normal_serums[@]}")"
        echo "Moisturizer: $(pick_products "${normal_moisturizers[@]}")"
        ;;
    "oily")
        echo "Cleanser: $(pick_products "${oily_cleansers[@]}")"
        echo "Toner: $(pick_products "${oily_toners[@]}")"
        echo "Essence: $(pick_products "${oily_essences[@]}")"
        echo "Serum: $(pick_products "${oily_serums[@]}")"
        echo "Moisturizer: $(pick_products "${oily_moisturizers[@]}")"
        ;;
    *)
        echo "Invalid skin type."
        ;;
esac

echo "Would you like more product recommendations? (yes/no)"
read more_recommendations
if [[ "$more_recommendations" == "yes" ]]; then
    echo "Here are some more K-beauty stores you can check out:"
    echo "1. StyleKorean (https://www.stylekorean.com)"
    echo "2. YesStyle (https://www.yesstyle.com)"
    echo "3. Olive Young Global (https://global.oliveyoung.com)"
fi

echo " Thanks for using Mangili, $user_name! Stay Glowing ✨💖"

