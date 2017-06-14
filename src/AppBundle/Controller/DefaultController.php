<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
        ]);
    }

    /**
     * @Route("/no-cache")
     */
    public function testNoCache()
    {
        $response = new Response();
        $response->headers->set('Cache-Control', 'no-cache');
        $response->setContent(__METHOD__);
        return $response;
    }

    /**
     * @Route("/max-age")
     */
    public function testMaxAge()
    {
        $response = new Response();
        $response->headers->set('Cache-Control', 'max-age=10, public');
        $response->setContent(__METHOD__);
        return $response;
    }

    /**
     * @Route("/shared-max-age")
     */
    public function testSharedMaxAge()
    {
        $response = new Response();
        $response->headers->set('Cache-Control', 'max-age=0, s-maxage=10, public');
        $response->setContent(__METHOD__);
        return $response;
    }

    /**
     * @Route("/shared-max-age-with-x-accel")
     */
    public function testSharedMaxAgeWithXAccel()
    {
        $response = new Response();
        $response->headers->set('Cache-Control', 'max-age=0, s-maxage=10, public');
        $response->headers->set('X-Accel-Expires', 10);
        $response->setContent(__METHOD__);
        return $response;
    }
}
