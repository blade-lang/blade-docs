---
layout: default
title: colors
parent: Standard Library
nav_order: 7
permalink: /standard/colors
---

# colors

This module provides functionalities for color conversion and manipulation.

This module also provides functionalities that enable cross-platform colored terminal outputs 
that will allow you create beautiful console apps that are user friendly.

RGB conversion to other colors that return a floating point or a list of floating points do so 
to allow users get absolute precision since its really easy for callers to do a `math.round()` 
on the components of the resulting list.

### Example

The example below uses this module to create a success message that will print correctly 
on almost all terminals (Only Windows 10 version 1901+ supported. All linux and OSX 
terminals are supported). Try it out!

```blade
import colors
colors.text('Successful!', colors.text_color.green)
```

The `text()` function can be nested. For example,

```blade
colors.text(colors.text('Successful!', colors.style.bold), colors.text_color.green)
```

The module also features multiple functions for color conversion. For example,

```blade-repl
%> import colors
%> colors.rgb_to_cmyk(103, 13, 69)
[0, 87.37864077669903, 33.00970873786409, 59.6078431372549]
```

The terminal colors also have simple wrappers that allow supplied colors to `text()` 
from various color formats. For example, we can specify the color from the HTML 
hexadecimal color.

```blade
import colors
colors.text('Colored text!', colors.hex('#fc0'))
```



<h2>Properties</h2><hr>

{:#colors__style} _colors._**style**
: ANSI font styles available for console applications


^
{:#colors__text_color} _colors._**text_color**
: Standard ANSI text colors available for console applications


^
{:#colors__background} _colors._**background**
: Standard ANSI background colors available for console applications




<h2>Functions</h2><hr>

{:#colors__text} _colors_.**text**(_value_: string [, _color_: int [, _bg_: int]])
: Returns a terminal printable text with the given color (or style) and background if given.
  > - The color argument can be replace with a style.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#colors__rgb_to_ansi256} _colors_.**rgb_to_ansi256**(_r_: int, _g_: int, _b_: int)
: converts RGB color to ASI-256 color number.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#colors__ansi256_to_ansi} _colors_.**ansi256_to_ansi**(_code_: int)
: converts ANSI-256 color number to ANSI-16 color number


^
{:#colors__hex_to_rgb} _colors_.**hex_to_rgb**(_h_: string)
: converts the hexadecimal string _h_ to its RGBA component
   <div class="cite"><span class="hint">return</span> <span>list</span></div>



^
{:#colors__hex_to_ansi256} _colors_.**hex_to_ansi256**(_color_: string)
: Converts the given hexadecimal color to its ANSI-256 number
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#colors__hex_to_ansi} _colors_.**hex_to_ansi**(_color_: string)
: Converts the given hexadecimal color to its ANSI-16 number.
  > - For use with `text()`, this should be prefered over `hex_to_ansi256`
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#colors__hex} _colors_.**hex**(_color_: string)
: Converts the given hexadecimal color to its terminal compatible color.
  > - For use with `text()`, this should be prefered over `hex_to_ansi256` and `hex_to_ansi`
  > - _color_ can include the '#' character. E.g. `#ff0`.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#colors__rgb} _colors_.**rgb**(_r_: int, _g_: int, _b_: int)
: Converts the given RGB color to its terminal compatible color.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#colors__hsl} _colors_.**hsl**(_h_: number, _s_: number, _l_: number)
: Converts the given HSL color to its terminal compatible color.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#colors__hsv} _colors_.**hsv**(_h_: number, _s_: number, _v_: number)
: Converts the given HSV color to its terminal compatible color.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#colors__hwb} _colors_.**hwb**(_h_: number, _s_: number, _v_: number)
: Converts the given HWB color to its terminal compatible color.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#colors__cmyk} _colors_.**cmyk**(_c_: number, _m_: number, _y_: number, _k_: number)
: Converts the given CMYK color to its terminal compatible color.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#colors__xyz} _colors_.**xyz**(_x_: number, _y_: number, _z_: number)
: Converts the given XYZ color to its terminal compatible color.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#colors__rgb_to_hex} _colors_.**rgb_to_hex**(_r_: int, _g_: int, _b_: int [, _a_: int])
: Converts a RGB components into its corresponding hexadecimal color.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#colors__rgb_to_hsl} _colors_.**rgb_to_hsl**(_r_: int, _g_: int, _b_: int)
: Converts a RGB color into its corresponding HSL components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



^
{:#colors__rgb_to_hsv} _colors_.**rgb_to_hsv**(_r_: int, _g_: int, _b_: int)
: Converts a RGB color into its corresponding HSV components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



^
{:#colors__rgb_to_hwb} _colors_.**rgb_to_hwb**(_r_: int, _g_: int, _b_: int)
: Converts a RGB color into its corresponding HWB components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



^
{:#colors__rgb_to_cmyk} _colors_.**rgb_to_cmyk**(_r_: int, _g_: int, _b_: int)
: Converts a RGB color into its corresponding CMYK components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



^
{:#colors__rgb_to_xyz} _colors_.**rgb_to_xyz**(_r_: int, _g_: int, _b_: int)
: Converts a RGB color into its corresponding XYZ color space components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



^
{:#colors__rgb_to_lab} _colors_.**rgb_to_lab**(_r_: int, _g_: int, _b_: int)
: Converts a RGB color into its corresponding LAB color components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



^
{:#colors__hsl_to_rgb} _colors_.**hsl_to_rgb**(_h_: number, _s_: number, _l_: number)
: Converts a HSL color into its corresponding RGB color components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



^
{:#colors__hsl_to_hsv} _colors_.**hsl_to_hsv**(_h_: number, _s_: number, _l_: number)
: Converts a HSL color into its corresponding HSV color components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



^
{:#colors__hsv_to_rgb} _colors_.**hsv_to_rgb**(_h_: number, _s_: number, _v_: number)
: Converts a HSV color into its corresponding RGB color components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



^
{:#colors__hsv_to_hsl} _colors_.**hsv_to_hsl**(_h_: number, _s_: number, _v_: number)
: Converts a HSV color into its corresponding HSL color components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



^
{:#colors__hwb_to_rgb} _colors_.**hwb_to_rgb**(_h_: number, _w_: number, _b_: number)
: Converts a HWB color into its corresponding RGB color components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



^
{:#colors__cmyk_to_rgb} _colors_.**cmyk_to_rgb**(_c_: number, _m_: number, _y_: number, _k_: number)
: Converts a CMYK color into its corresponding RGB color components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



^
{:#colors__xyz_to_rgb} _colors_.**xyz_to_rgb**(_x_: number, _y_: number, _z_: number)
: Converts a XYZ color into its corresponding RGB color components.
   <div class="cite"><span class="hint">return</span> <span>list[float]</span></div>



