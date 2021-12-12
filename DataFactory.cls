@isTest

public class DataFactory {

    public static List<Ingredient__c> createAndReturnIngredients(Integer numberOfIngredients){
        /*create a recipe and insert it
        Recipe__c recipe = new Recipe__c();
        recipe.Name = 'Great recipe';
        recipe.Active_Time__c = 30;
        recipe.Active_Time_Units__c = 'Minutes';
        recipe.Servings__c = 4;
        recipe.Description__c = 'This is fabulous and simple recipe';
        insert recipe;
        System.debug('The newly created recipe has an id of '+recipe.Id);*/
        
        //create a list to hold the new ingredients SObjects
        List<Ingredient__c> createdIngredients = new List <Ingredient__c>();
      
        //user the numberofIngredients integer in a for loop to create the desired number of Ingredients
        for (Integer counter=1; counter <= numberofIngredients; counter ++){
            Ingredient__c ingredientRecord = new Ingredient__c();
            ingredientRecord.Name = 'Ingredient '+counter;
            //ingredientRecord.Recipe__c=recipe.Id;
            //add each one to the list
            createdIngredients.add(ingredientRecord);
            
        }
        
        //return the records
        System.debug('This is the createdIngredients list: '+createdIngredients);
        return createdIngredients;
        
    }

    
    public static List<Ingredient__c> insertAndReturnIngredients(Integer numberOfIngredients){
        //create a recipe and insert it
        Recipe__c recipe = new Recipe__c();
        recipe.Name = 'Great recipe';
        recipe.Active_Time__c = 30;
        recipe.Active_Time_Units__c = 'Minutes';
        recipe.Servings__c = 4;
        recipe.Description__c = 'This is fabulous and simple recipe';
        insert recipe;
        System.debug('The newly created recipe has an id of '+recipe.Id);
        
        //create a list to hold the new ingredients SObjects
        List<Ingredient__c> newIngredients = new List <Ingredient__c>();
      
        //user the numberofIngredients integer in a for loop to create the desired number of Ingredients
        for (Integer counter=1; counter <= numberofIngredients; counter ++){
            Ingredient__c ingredientRecord = new Ingredient__c();
            ingredientRecord.Name = 'Ingredient '+counter;
            ingredientRecord.Recipe__c=recipe.Id;
            //add each one to the list
            newIngredients.add(ingredientRecord);
        }
        
        //It SHOULD INSERT the records and return them
        insert newIngredients;
        System.debug('This is the newIngredients list: '+newIngredients);
        return newIngredients;
        
    }
    
    public static List <Recipe__c> createRecipes(Integer numberOfRecipes, List <Ingredient__c> ingredientsList){
        //instantiate a List for the recipes to be created
        List <Recipe__c> recipesList = new List <Recipe__c>();
        //use a for loop with a counter to create the desired number of recipe records
        for (Integer counter = 1; counter <=numberofRecipes; counter++){
            Recipe__c newRecipe = new Recipe__c();
            newRecipe.Name = 'Delicious recipe' + counter;
            newRecipe.Active_Time__c = 15 * counter;
            newRecipe.Active_Time_Units__c = 'Minutes';
            newRecipe.Servings__c = counter;
            newRecipe.Description__c = 'This is the description for Delicious recipe'+counter;
            recipesList.add(newRecipe);
            System.debug('Current recipe name is '+newRecipe.Name);
        }
        insert recipesList;
        
        //instantiate an integer that is number of recipes divided by 2
        Integer halfOfRecipes = numberofRecipes/2;
        System.debug('Half of recipes = '+halfOfRecipes);
        
        //and another that is ingredients divided by 2
        Integer halfOfIngredients=ingredientsList.size()/2;
        System.debug('Half of ingredients = '+halfOfIngredients);
       
        //instantiate a counter for recipes
        Integer recipeCounter= 1;

        //instantiate a counter for ingredients
        Integer ingredientCounter;
        
        
      //instantiate a new list of ingredients to be inserted
        List<Ingredient__c> ingredientsToInsert = new List <Ingredient__c>();
        
        //then use them in a for loop counter to divide the recipes into two groups
        //so that different ingredients can be used for each list
        for (Recipe__c currentRecipe : recipesList){
            if(recipeCounter<=halfOfRecipes){
                ingredientCounter=0;
                System.debug('Current recipe first half is '+currentRecipe.Name);
                for(Ingredient__c currentIngredient; ingredientCounter<halfOfIngredients; ingredientCounter++){
                   currentIngredient=ingredientsList.get(ingredientCounter);
                   currentIngredient.Recipe__c=currentRecipe.Id;
                   System.debug('Current ingredient is '+currentIngredient.Name);
                   ingredientsToInsert.add(currentIngredient);
                }
                recipeCounter++;
            }
            else{
                ingredientCounter = halfOfIngredients;
                System.debug('Current recipe second half is'+currentRecipe.Name);
                for(Ingredient__c currentIngredient; ingredientCounter<ingredientsList.size(); ingredientCounter++){
                    currentIngredient=ingredientsList.get(ingredientCounter);
                    currentIngredient.Recipe__c=currentRecipe.Id;
                    System.debug('Current ingredient is '+currentIngredient.Name);
                    ingredientsToInsert.add(currentIngredient);
                }
                recipeCounter++;
            }
            //EITHER THE FOLLOWING RECIPE COUNTER ++ OR 122 AND 111
            //recipeCounter ++;
        }
        System.debug('ingredientsToInsert list is ' + ingredientsToInsert);
        //REMOVE COMMENT WHEN SORTED SO THAT INGREDIENTS INSERT
        //insert ingredientsToInsert;
        return recipesList;
    }
}
