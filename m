Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF9E311DFF
	for <lists+linux-remoteproc@lfdr.de>; Sat,  6 Feb 2021 15:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhBFOwO (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 6 Feb 2021 09:52:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhBFOwL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Feb 2021 09:52:11 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BEAAC0617A9
        for <linux-remoteproc@vger.kernel.org>; Sat,  6 Feb 2021 06:51:12 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id c6so12931922ede.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 06 Feb 2021 06:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=WrtGTUT0AMDNaEpiMi3AfBgka/5v06W3cfoaRsnLtLYBJLZRhOLKU9JrG4fk7ClicM
         HKD4gTKEhM8Zufj/2V9b/ScABk1fFAFmA3pqM2EQADSRAeil1W/Ac5hwNB/U1+2+ULh9
         ZKP8hPsfcc8D33ql2VVT4T4A1I/GZ8fVEh8KiOHvZSMQpdwubdLk2CtuduMyiUWgcib4
         kq87fCf0bOHPqY5WlrrdIfO965UjVZ8vQVSCaNDDdIxYV7OrBXREw333V4a2I2hleYCG
         MddbUX+BmhLhLP010TkcJR23STW+g5gP7cRajKtYgRYYXGcAa3rJ4KU3/xxRu59sj9vL
         x/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=bY+A2IBQ1RknFksncgrygmDxWljWJOFpTstpTfW8UOpT4J8P4yWw9ORY0+w8JFZqgI
         9g1zuJTM5n5Y2/OqLIUXgIwz1KTzT4SjVkC5O9OzBnhnNqjHe+e7TSXuQWxkbdCoGJcG
         EsJKNI/BtjSXmb0HCvC5t2ugk64co8nCcxx+m2QL//OyhRCIV6lbJvUUSctKPxlMOlqa
         EpbjobsBb4E8jC5MbxYITcJiQ/gCGhJ6FqdQGUDNXo6oH/n6T8j7TdxwgS6Hzsu6flT9
         h7NTsJJebINH11iB3qLwjeCOLF4VS/KCkcv8vNiwRNtAEwt0kXMRTat1jCymcR6HCHz5
         ADdA==
X-Gm-Message-State: AOAM531xYCTn41SCn5GiZUbFrcKlbofkEqqxakUG7dx2kcZIXViWNXZp
        eucjRhn9BTgHaqwnQFf5qp2n4+upom+PuEw9XbA=
X-Google-Smtp-Source: ABdhPJwCJU3xmGNfIdrdk4AuLRfQKDsVIFJookscTN8wqEBKij959yzOJwV8TNvAk+gLbIiWMW+aP6D0WqBV8ojtk50=
X-Received: by 2002:a05:6402:149:: with SMTP id s9mr8649014edu.247.1612623071178;
 Sat, 06 Feb 2021 06:51:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:51:10
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:51:10 +0100
Message-ID: <CAGSHw-AO+Xa_koG5i0-JjSgLnhK_AGLnUpJ4Pmo9++psOxZVXw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
