image_alpha = image_alpha * .7;

image_xscale = image_alpha;
image_yscale = image_alpha;

if (image_alpha <= 0)
{
    instance_destroy();
}