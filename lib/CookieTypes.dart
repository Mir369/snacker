import 'package:flutter_application_2/Cookie.dart';

class CookieTypes {
  static List<Cookie> cookies = <Cookie>[
    Cookie(
      'Chocolate Chip Cookies', 
      ['assests/co1.jpg', 'assests/co2.jpg', 'assests/co3.jpg', 'assests/co4.jpg'], // image locations string format
      [
        // Ingredients 
        '2 1/4 cups all-purpose flour',
        '1/2 teaspoon baking soda',
        '1 cup unsalted butter, softened',
        '1/2 cup granulated sugar',
        '1 cup packed brown sugar',
        '1 teaspoon vanilla extract',
        '2 large eggs',
        '2 cups semisweet chocolate chips'
      ],
      [
        // Instructions 
        '1. Preheat oven to 350°F (175°C) and line baking sheets with parchment paper.',
        '2. In a small bowl, whisk together the flour and baking soda; set aside.',
        '3. In a large mixing bowl, cream together the softened butter, granulated sugar, and brown sugar until light and fluffy. Beat in the vanilla extract and eggs until well combined.',
        '4. Gradually add the dry ingredients to the wet ingredients, mixing until just combined. Fold in the chocolate chips.',
        '5. Drop rounded spoonfuls of dough onto the prepared baking sheets, leaving space between each cookie.',
        '6. Bake for 10-12 minutes, or until the edges are lightly golden brown.',
        '7. Allow the cookies to cool on the baking sheet for 5 minutes before transferring them to a wire rack to cool completely.'
      ]
    ),
    Cookie(
      'Oreos', 
      ['assests/o1.jpg','assests/o2.jpg','assests/o3.jpg','assests/o4.jpg'],
      [
       
        'For Cookies:',
        '2 cups all-purpose flour',
        '3/4 cup unsweetened cocoa powder',
        '1 teaspoon baking soda',
        '1/2 teaspoon salt',
        '1 cup unsalted butter, softened',
        '1 1/3 cups granulated sugar',
        '2 large eggs',
        '2 teaspoons vanilla extract',
        'For Cream Filling:',
        '1/2 cup unsalted butter, softened',
        '2 cups powdered sugar',
        '2 teaspoons vanilla extract',
        '2 tablespoons heavy cream'
      ],
      [
  
        '1. Preheat oven to 350°F (175°C) and line baking sheets with parchment paper.',
        '2. In a medium bowl, whisk together flour, cocoa powder, baking soda, and salt.',
        '3. In a large bowl, cream together softened butter and granulated sugar until light and fluffy. Beat in eggs, one at a time, then stir in vanilla extract.',
        '4. Gradually add dry ingredients to wet ingredients, mixing until well combined.',
        '5. Roll dough into 1-inch balls and place on prepared baking sheets, flattening each ball slightly with the palm of your hand.',
        '6. Bake for 10-12 minutes, then transfer cookies to a wire rack to cool completely.',
        '7. For the cream filling, beat together softened butter, powdered sugar, and vanilla extract until smooth. Add heavy cream and beat until light and fluffy.',
        '8. Once cookies are cooled, spread a dollop of cream filling onto the flat side of one cookie and sandwich with another cookie.',
        '9. Repeat with remaining cookies and filling.',
        '10. Enjoy your homemade Oreos!'
      ]
    ),
    Cookie(
      'Macarons', 
      ['assests/m1.jpg', 'assests/m2.jpg', 'assests/m3.jpg', 'assests/m4.png'],
      [
        '2/3 cup sweetened condensed milk',
        '1 large egg white',
        '1 1/2 teaspoons vanilla extract',
        '1/8 teaspoon salt',
        '1 14-ounce package sweetened shredded coconut',
      ],
      [
        '1. Preheat oven to 325°F (163°C) and line a baking sheet with parchment paper.',
        '2. In a medium bowl, mix together sweetened condensed milk, egg white, vanilla extract, and salt until well combined.',
        '3. Stir in shredded coconut until evenly coated.',
        '4. Drop the mixture by rounded tablespoonfuls onto the prepared baking sheet, spacing them about 1 inch apart.',
        '5. Bake for 20-25 minutes, or until the macaroons are golden brown around the edges.',
        '6. Remove from the oven and allow to cool on the baking sheet for 5 minutes before transferring to a wire rack to cool completely.'
      ]
    ),
    Cookie(
      'Gingerbread Cookies', 
      ['assests/g1.jpg','assests/g2.jpg','assests/g3.jpg','assests/g4.jpg'],
      [
        '3 cups all-purpose flour',
        '1 tablespoon ground ginger',
        '1 teaspoon ground cinnamon',
        '1/2 teaspoon ground cloves',
        '1/2 teaspoon baking soda',
        '1/2 teaspoon salt',
        '1/2 cup unsalted butter, softened',
        '1/2 cup packed brown sugar',
        '1 large egg',
        '1/2 cup unsulfured molasses',
      ],
      [
        '1. In a medium bowl, whisk together the flour, ginger, cinnamon, cloves, baking soda, and salt.',
        '2. In a large bowl, beat together the softened butter and brown sugar until light and fluffy. Beat in the egg and molasses until well combined.',
        '3. Gradually add the dry ingredients to the wet ingredients, mixing until a dough forms.',
        '4. Divide the dough in half, wrap each portion in plastic wrap, and refrigerate for at least 1 hour.',
        '5. Preheat oven to 350°F (175°C) and line baking sheets with parchment paper.',
        '6. On a lightly floured surface, roll out one portion of the dough to about 1/4 inch thickness. Use cookie cutters to cut out shapes.',
        '7. Place the cookies on the prepared baking sheets and bake for 8-10 minutes, or until the edges are set and lightly browned.',
        '8. Allow the cookies to cool on the baking sheets for 5 minutes before transferring them to a wire rack to cool completely.'
      ]
    ),
    Cookie(
      'Fortune Cookies', 
      ['assests/f1.jpg','assests/f2.jpg','assests/f3.jpg','assests/f4.jpg'],
      [
        '2 large egg whites',
        '1/2 cup granulated sugar',
        '1/4 cup unsalted butter, melted',
        '1/4 teaspoon vanilla extract',
        '1/4 teaspoon almond extract',
        '1/2 cup all-purpose flour',
        '2 tablespoons water'
      ],
      [
        '1. Preheat oven to 400°F (200°C) and line baking sheets with parchment paper or silicone baking mats.',
        '2. In a medium bowl, whisk together egg whites, sugar, melted butter, vanilla extract, and almond extract until well combined.',
        '3. Stir in flour until smooth, then add water and mix until the batter is thin and smooth.',
        '4. Drop tablespoonfuls of batter onto the prepared baking sheets, spreading each into a 3-inch circle using the back of a spoon.',
        '5. Bake for 5-7 minutes, or until the edges are lightly golden brown.',
        '6. Working quickly, use a spatula to remove the cookies from the baking sheets and place a fortune in the center of each. Fold the cookies in half, then gently bend over the edge of a mug or bowl to form the classic fortune cookie shape.',
        '7. Allow the cookies to cool completely before serving.'
      ]
    ),
    Cookie(
      'Biscuit', 
      ['assests/b1.jpg','assests/b2.jpg','assests/b3.jpg','assests/b4.jpg'],
      [
        '2 cups all-purpose flour',
        '1 tablespoon baking powder',
        '1 teaspoon salt',
        '1/3 cup shortening',
        '3/4 cup milk'
      ],
      [
        '1. Preheat oven to 450°F (230°C).',
        '2. In a large bowl, sift together the flour, baking powder, and salt.',
        '3. Cut in the shortening until the mixture resembles coarse crumbs.',
        '4. Make a well in the center and pour in the milk. Stir until the dough pulls away from the sides of the bowl.',
        '5. Turn the dough out onto a floured surface and knead 15 to 20 times. Roll out to 1/2-inch thickness and cut with a biscuit cutter.',
        '6. Place the biscuits on an ungreased baking sheet.',
        '7. Bake for 12 to 15 minutes, or until golden brown.'
      ]
    ),
    Cookie(
      'Jam Cookies', 
      ['assests/j1.jpg','assests/j2.jpg','assests/j3.jpg','assests/j4.jpeg'],
      [
        '1 cup unsalted butter, softened',
        '1 cup granulated sugar',
        '2 large eggs',
        '1 teaspoon vanilla extract',
        '3 cups all-purpose flour',
        '1 teaspoon baking powder',
        '1/2 teaspoon salt',
        '1/2 cup jam (any flavor)'
      ],
      [
        '1. Preheat oven to 350°F (175°C). Line baking sheets with parchment paper.',
        '2. In a large bowl, cream together butter and sugar until light and fluffy. Beat in eggs and vanilla.',
        '3. In a separate bowl, whisk together flour, baking powder, and salt. Gradually add to the creamed mixture and mix well.',
        '4. Shape dough into 1-inch balls and place 2 inches apart on prepared baking sheets.',
        '5. Make an indentation in the center of each ball with your thumb or the back of a spoon. Fill each indentation with about 1/2 teaspoon of jam.',
        '6. Bake for 10 to 12 minutes or until edges are lightly golden brown.',
        '7. Cool on baking sheets for 5 minutes before transferring to wire racks to cool completely.'
      ]
    ),
    Cookie(
      'Cracker', 
      ['assests/c1.jpg','assests/c2.jpg','assests/c3.jpg','assests/c4.jpg'],
      [
        '2 cups all-purpose flour',
        '1 tablespoon granulated sugar',
        '1/2 teaspoon baking powder',
        '1/2 teaspoon salt',
        '1/2 cup unsalted butter, cold and cubed',
        '1/2 cup milk',
        'Additional salt for topping (optional)'
      ],
      [
        '1. Preheat oven to 400°F (200°C). Line baking sheets with parchment paper.',
        '2. In a large bowl, whisk together flour, sugar, baking powder, and salt.',
        '3. Cut in cold butter until mixture resembles coarse crumbs.',
        '4. Stir in milk until dough comes together.',
        '5. Turn dough out onto a lightly floured surface and knead briefly until smooth.',
        '6. Divide dough in half and roll each half out very thinly, about 1/8 inch thick.',
        '7. Cut dough into desired shapes and place on prepared baking sheets. Prick each cracker with a fork and sprinkle with additional salt if desired.',
        '8. Bake for 10-12 minutes or until golden brown and crisp.',
        '9. Cool completely on wire racks before serving or storing in an airtight container.'
      ]
    ),
  ];
}